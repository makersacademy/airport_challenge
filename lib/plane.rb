require_relative "airport.rb"

class Plane

  attr_accessor :flying, :in_airport, :location

  def initialize
    @flying = true
    @in_airport = false
  end

  def flying?
    flying
  end

  def in_airport?
    in_airport
  end

  def set_airport(airport_id)
    location = airport_id
  end
=begin
  def check_location
    fail "Plane is flying" if !in_airport?
    airport_id
  end
=end
end
