require_relative 'Plane'

class Airport
  attr_reader :planes_in_airport, :DEFAULT_AIRPORT_CAPACITY

  def initialize(capacity = 5)
    @planes_in_airport = []
    @DEFAULT_AIRPORT_CAPACITY = capacity
  end

  def land_plane(plane)
    # check weather if ok then >>
    prevent_landed_planes_landing(plane)
    fail "Aiport is full, over" if full?
    fail "Weather is preventing this, over" if stormy?
    @planes_in_airport << plane
    "Plane is clear to land, over"
  end

  def take_off(removed_plane)
    # check weather if ok then >>
    prevent_mid_air_takeo_ff(removed_plane)
    if stormy?
    else
    # move plane out of @planes_in_airport then confirm plane has left
      @planes_in_airport.delete(removed_plane)
      # "#{removed_plane} has left the airport, over"
      "Plane can proceed to runway and takeoff, over"
    end
  end

  private

  def stormy?
    rand(10) >= 6
  end

  def full?
    @DEFAULT_AIRPORT_CAPACITY <= @planes_in_airport.size
  end

  def prevent_mid_air_takeo_ff(removed_plane)
    fail "Plane is already in the air, over" unless @planes_in_airport.include?(removed_plane)
  end

  def prevent_landed_planes_landing(plane)
    fail "Plane has already landed, over" if @planes_in_airport.include?(plane)
  end


end
