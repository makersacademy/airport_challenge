class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end
  
  def landed(plane)
    raise "It is too stormy to land now. You will have to fly around a little longer" if weather == "Stormy"
    
    planes << plane
    "Plane has touched down!!"
  end
  
  def leave_gate
    raise "It is too stormy to take off now. Wait until it is calmer" if weather == "Stormy"
    planes.pop
    "Plane has taken off!!"
  end
  
  private
  
  def weather
    @weather = ["Sunny", "Raining", "Snow", "Hail", "Stormy"]
    @weather[rand(0..4)]
  end
end