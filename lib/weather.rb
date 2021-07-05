class Weather
    attr_reader :sunny
    
    def initialize
      @conditions = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy'].sample
    end

    def sunny?
       if @conditions == 'sunny'
        puts 'good do go'
       else 
        puts 'hold, weather conditions not good'
       end
    end
end