require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :terminal, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @terminal = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail 'cannot land' if :bad_weather? || :full?
    @terminal << plane
  end

  def take_off
    fail 'cannot take off' if :bad_weather? || :empty?
    @terminal.pop
  end

  private

  def bad_weather?
    @weather.stormy?
  end

  def full?
    @terminal.count >= capacity
  end

  def empty?
    @terminal.empty?
  end

end
