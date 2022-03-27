require "airplane"

class Airport

AIRPORT_CAPACITY = 30

attr_reader :airplanes
attr_accessor :capacity

  def initialize(capacity = AIRPORT_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end

  def land_airplane
    fail "ATTENTION! Airport full!" if airport.size == capacity
    fail "Airplane landed at airport" if airplane.landed
    airplane.landed = true
    airplanes << airplane
  end

  def check_airplane_status(airplane)
    airplanes.each_with_index do |check, index|
      next unless check == airplane
      airplanes.delete_at(index)
      airplane.landed = false
      return airplane
    end
  end

  def take_off_airplane
    fail "Airplane is already in the sky!" unless airplane.landed
    return airplane if check_airplane_status(airplane) == airplane
    fail "Airplane is not at this airport!"
  end
end
