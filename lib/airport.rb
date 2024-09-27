require_relative 'airplane'

class Airport

  DEFAULT_CAPACITY = 1

  attr_reader :airplanes
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end

  def land(airplane, weather = 'sunny')
    @weather = weather
    stormy?
    fail 'Cannot land plane due to stormy weather' if weather == 'stormy'
    fail 'Airport is full' if full?

    airplanes << airplane
  end

  def take_off(airplane, weather = 'sunny')
    @weather = weather
    stormy?
    fail 'Cannot takeoff plane due to stormy weather' if weather == 'stormy'
    return airplane if check_plane(airplane) == airplane

    puts "#{airplane} is no longer at airport"
  end

  private

  def check_plane(airplane)

    airplanes.each_with_index do |test, column|
      next unless test == airplane

      airplanes.delete_at(column)
    end
  end

  def full?
    airplanes.count >= capacity
  end
end

def stormy?
  weather_choice = rand(1..2)
  if weather_choice == 1
    weather == 'sunny'
  elsif weather_choice == 2
    weather == 'stormy'
  end
end
