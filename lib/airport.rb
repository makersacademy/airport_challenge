class Airport

  def initialize
    @airplanes = []
  end

  def accept_plane(airplane)
    airplanes << airplane
    airplane.plane_landed
    landing_confirmed
  end

  def release_plane(airplane)
    @airplanes = @airplanes.select{ |plane| plane != airplane }
    airplane.plane_flying
    takeoff_confirmed
  end

  attr_reader :airplanes

private

  def landing_confirmed
    puts 'Landing successful'
  end

  def takeoff_confirmed
    puts 'Takeoff successful'
  end

end
