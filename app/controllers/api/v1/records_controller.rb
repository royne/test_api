module Api
  module V1
    class RecordsController < ApplicationController
      
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

      private 

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