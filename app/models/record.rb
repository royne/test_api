class Record < ApplicationRecord

    def self.generate_array(number)
      arr = []
      while arr.length < number  do
        number_rand = rand(31)  
        while !arr.include?(number_rand) do  
          arr.push(number_rand)    
        end  
      end  
      self.arr = arr
    end

end
