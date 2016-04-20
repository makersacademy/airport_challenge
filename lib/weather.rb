class Weather

    attr_reader :weather

    def self.weather? #self used as will be a method of Weather class. dont need to call it on an object of another class.
      rand(10) > 8 ? true : false #doesnt need to be set to a variable as it returns a boolean
    end

end