class Airport

  attr_accessor :weather

def initialize
  @weather = rand(10)
end

def weather_type
  @weather <= 8? "sunny" : "stormy"
end

def land plane

end







end
