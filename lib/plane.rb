require_relative 'airport'

class Plane
  attr_reader :location, :airport

  def initialize
    @location = "in_flight"
  end

  def land(airport)
    fail "Plane has already landed" if located?(airport)

    airport.request_landing(self)
    change_location(airport)
  end

  def take_off
    fail "Plane is already in flight" if located?("in_flight")

    airport.request_take_off(self)
    change_location("in_flight")
  end

  private

  def located?(check_location)
    location == check_location
  end

  def change_location(new_location)
    case new_location
      when "in_flight"
        @location = "in_flight"
        @airport = ""
      else
        @location = @airport = new_location
    end
  end
end
