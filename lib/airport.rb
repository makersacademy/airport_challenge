class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end
  
  def landed(plane)
    raise "It is too stormy to land now." if weather == "Stormy"
    raise "Airport is full." if full?
    planes << plane
    "Plane has touched down!!"
  end
  
  def leave_gate
    raise "It is too stormy to take off." if weather == "Stormy"
    planes.pop
    "Plane has taken off!!"
  end
  
  private
  
  def weather
    @weather = ["Sunny", "Raining", "Snow", "Hail", "Stormy"]
    @weather[rand(0..4)]
  end
  
  def full?
    @planes.count >= 15
  end
end