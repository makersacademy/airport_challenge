class Weather
 attr_reader :weather

 def initialize
   @weather = ["stormy", "sunny"]

    @weather.sample
  end
end
