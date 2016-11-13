require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_accessor :default_capacity

  def initialize
    @plane = []
    @default_capacity = 100
  end

  def land(plane)
    fail "Due to bad weather, aircraft are unable to land." if check_weather == "stormy"
    fail "Airport at full capacity, no space available." if @plane.size == @default_capacity
    @plane.include?(plane) ? false : @plane << plane
  end

  def take_off(plane)
    fail "This plane hasn't landed at this airport!" if !confirm_landed(plane)
    fail "Due to bad weather, all flights are grounded." if check_weather == "stormy"
    @plane.delete(plane)
    plane
  end

  def confirm_landed(plane)
    return false if @plane.nil?
    @plane.include?(plane)
  end

  def check_weather
    Weather.new.today
  end

end
