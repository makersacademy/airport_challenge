require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
    @plane
  end

  def take_off(plane)
    fail "This plane hasn't landed at this airport!" if !confirm_landed(plane)
    fail "Due to bad weather, all flights are grounded." if check_weather == "storm"
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
