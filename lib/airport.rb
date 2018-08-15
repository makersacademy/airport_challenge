require_relative 'weather'

class Airport

  attr_reader :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    fail "Hangar Full!!!" if full?
    fail "Cannot land due to bad weather!" if stormy?
    fail "Plane is already on the ground!" if @hangar.include?(plane)
    @hangar << plane
  end

  def take_off(plane)
    fail "No planes on the ground!" if empty?
    fail "Cannot take off due to bad weather!" if stormy?
    fail "Plane is not at the airport!" unless @hangar.include?(plane)
    @hangar.delete(plane)
  end

  private

  def full?
    @hangar.size >= @capacity
  end

  def empty?
    @hangar.empty?
  end

  def stormy?
    weather.conditions == :stormy
  end
end
