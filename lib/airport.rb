require_relative 'plane'

class Airport

  attr_accessor :weather

def initialize
  @weather = rand(10)
  @planes = []
end

def weather_type
  @weather <= 8? 'sunny' : 'stormy'
end

def land plane
  fail 'Weather is stormy. Try to land later' if self.weather_type == 'stormy' #when do we use self?
  

  @planes << plane
end








end
