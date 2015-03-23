require_relative 'plane'

class Airport
  def initialize
    @planes = []
    @capacity = 20
    @weather = %w(sunny stormy).sample
  end

  attr_reader :planes

  attr_reader :capacity

  attr_reader :weather

  attr_writer :weather

  def land plane
    fail 'Bad Weather' if bad_weather?
    fail 'Airport Full' if full?
    planes << plane
    plane.landed
  end

  def take_off
    fail 'Bad Weather' if bad_weather?
    fail 'Airport Empty' if empty?
    planes.last.take_off
    planes.pop
  end

  private

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

  def bad_weather?
    weather == 'stormy'
  end
end
