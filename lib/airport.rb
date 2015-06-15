require 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity 
  attr_reader :landed_planes

  def initialize 
   @capacity = DEFAULT_CAPACITY
   @landed_planes = []  
  end

  def instruct_land plane
    fail 'Planes cannot land during stormy weather' if weather_conditions == 'stormy'
    fail "Airport is full" if full?
    landed_planes << plane
  end

  def instruct_take_off plane
    fail 'Planes cannot take off during stormy weather' if weather_conditions == 'stormy'
    fail 'No planes to take off' if empty?
    landed_planes.delete plane 
  end

  def weather_conditions
    current_weather = ['sunny','stormy']
    current_weather[rand(current_weather.count)]
    self
  end

  private

  def full?
    landed_planes.count >= capacity
  end

  def empty?
    landed_planes == []
  end
  
end