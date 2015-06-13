require_relative 'plane'

class Airport

  attr_accessor :capacity
  attr_reader :planes

  def initialize capacity=100
    @planes = []
    @capacity = capacity
  end

  def take_off plane
    fail 'Too stormy to take off' if current_weather == 'stormy'
    fail 'The plane is not at the airport' unless planes.include?(plane)
    planes.delete(plane)
    plane.take_off
  end

  def landing plane
    fail 'Too stormy to land' if current_weather == 'stormy'
    fail 'Cannot land plane. Airport is full' if full?
    planes << plane
    plane.land
  end

  def full?
    planes.count >= capacity
  end

  private

  def current_weather
    weather_conditions = ['sunny','stormy']
    weather_conditions[rand(weather_conditions.length)]
  end

end
