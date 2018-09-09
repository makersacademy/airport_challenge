require_relative './plane'
require_relative './weather'
class Airport
  attr_reader :weather, :planes, :max_capacity

  def initialize(weather, planes, max_capacity = 1)
    fail 'Planes count is greater than maximum capacity'\
     if planes.length > max_capacity
    @weather = weather
    @planes = planes
    @max_capacity = max_capacity
  end

  def land(plane)
    fail "Plan has already landed" if @planes.include?(plane)
    fail "Plane can not land due to bad weather condition" if stormy?
    fail "Airport is full" if full?
    @planes.push(plane)
  end

  def take_off(plane)
    fail "Plane can not take off due to bad weather condition" if stormy?
    @planes.delete(plane)
  end

  def change_capacity(new_capacity)
    fail 'New capacity is less than existing plane'\
     if cannot_change_to_capacity?(new_capacity)
    @max_capacity = new_capacity
  end

  private
  def full?
    @planes.length >= @max_capacity
  end

  def stormy?
    @weather.condition == 'stormy'
  end

  def cannot_change_to_capacity?(new_capacity)
    @planes.length > new_capacity
  end
end
