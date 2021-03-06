module Api
  module V1
    class RecordsController < ApplicationController
      before_action :set_record, only: [:show]

      def create
        number =  params[:value].to_i
        if number >= 10
          @record = Record.new
          @record = Record.new(arr: generate_array(number))
          if @record.save
            render json: @record, status: :created
          else
            render json: @record.errors, status: :unprocessable_entity
          end
        else
          render json: {error: "el valor debe ser mayor o igual a 10 "}, status: :unprocessable_entity
        end
      end

      def show
        arr = @record.arr.map { |x| x.to_i }.sort
        range = []

        arr.each_with_index do |x, i|
          unless (arr.count > i+1 && arr[i+1] - x <= 1)   
            range.empty? ? range.push([arr[0], x]) : range.push([arr[arr.index(range.last[1]) + 1], x])    
          end  
        end  

        arr_max = range.map { |x| x[1]-x[0] } 
        data = range[arr_max.index(arr_max.max)]

        render json: data

      end

      private 

        def set_record
          @record = Record.find(params[:id])
        end

        def generate_array(number)
          arr = []
          while arr.length < number.to_i  do
            number_rand = rand(31)  
            while !arr.include?(number_rand) do  
              arr.push(number_rand)    
            end  
          end  
          arr
        end
      
    end
  end
end