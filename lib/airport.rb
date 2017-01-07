require_relative "airplane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :airplanes
  attr_accessor :capacity, :sunny

  def initialize(capacity=DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
    condition = Weather.new
    @weather = condition.sunny
  end

  def land_plane(airplane)
    fail "Airport full!" if airplanes.length == capacity
    fail "Weather Stormy cannot land" unless sunny
    fail "Airplane is already here" if airplane.landed
    airplane.landed = true
    airplanes << airplane
  end

  def takeoff_plane(airplane)
    fail "Weather Stormy cannot take off" unless sunny
    fail "Airplane is already in the sky!" unless airplane.landed
    return airplane if check_plane(airplane) == airplane
    fail "Airplane is not at this airport"
  end

  private

  def check_plane(airplane)
    airplanes.each_with_index do |check,index|
      next unless check == airplane
      airplanes.delete_at(index)
      airplane.landed = false
      return airplane
    end
  end

end
