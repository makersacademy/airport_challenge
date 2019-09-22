require_relative 'plane'

class Airport

  attr_accessor :planes, :weather

  def initialize
    @planes = []
  end

  def weather_generator
    random_number = rand(1..10)
    if random_number == 10
      return :stormy
    else
      return :sunny
    end
   end

   def weather
     @weather = weather_generator
   end

  # new methods
  def take_off(plane)
    check_in_the_air(plane)
    check_weather
    plane.report_flying
    @planes.delete(plane)
  end   
   

  def check_in_the_air(plane)
    fail 'Error: You have already taken off' if plane.flying == true 
  end

    
  def check_weather
    weather
    fail 'Error: Too stormy' if @weather == :stormy
  end

   
  def land(plane)
    check_landed(plane)
    check_weather
    plane.report_landed    
    @planes << plane
  end

  def check_landed(plane)
    fail "Error: You have already landed this plane" if plane.landed == true
  end

end