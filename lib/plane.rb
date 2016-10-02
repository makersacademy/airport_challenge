require_relative "airport.rb"

class Plane

  attr_accessor :flying, :in_airport, :location

  def initialize
    @flying = true
    @in_airport = false
    @location = "Plane is flying"
  end

  def flying?
    flying
  end

  # For a reason which I can't explain, this method won't work without the @ symbol.
  def set_location(airport_id)
    @location = "Plane is at airport #{airport_id}"
  end

  def get_location
    location
  end

end
