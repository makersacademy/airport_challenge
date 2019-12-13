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

  def land(airplane, weather = 'normal')
    @weather = weather
    fail 'Cannot land plane due to stormy weather' if stormy?
    fail 'Airport is full' if full?

    airplanes << airplane
  end

  def take_off(airplane, weather = 'normal')
    @weather = weather
    fail 'Cannot takeoff plane due to stormy weather' if stormy?
    return airplane if check_plane(airplane) == airplane

    puts "#{airplane} is no longer at airport"
  end

  private

  def check_plane(airplane)
    airplanes.each_with_index do |check, index|
      next unless check == airplane

      airplanes.delete_at(index)
    end
  end

  def full?
    airplanes.count >= capacity
  end

  def stormy?
    weather == 'stormy'
  end
end
