

class Aeroplane

  attr_accessor :airport

  def initialize
    # plane starts in the air
    @airport = nil
  end

  def try_land airport, weather = Weather.generate

    # make sure there is space to land, it it is, can't land
    if airport.full? then
      puts "Airport is currently full!"
      return false

    # make sure it is sunny, if not, can't land
    elsif weather != $sunny
      puts "Aeroplane can't land in #{weather} weather."
      return false

    # ok to land
    else
      puts "Aeroplane landed at airport!"
      land_plane airport
    end

  end

  def try_take_off weather = Weather.generate

    if airport.nil? then puts "Plane is not at an airport" end

    # make sure it is sunny, if not, can't land
    if weather != $sunny then
      puts "Aeroplane can't take off in #{weather} weather."
      return false

    # ok to land
    else
      puts "Aeroplane took off from airport!"
      take_off
    end

  end

  # returns true is plane is currently at an airport
  def in_airport?
    @airport != nil
  end

  private

  # complete take off
  def take_off
    @airport.on_take_off self
    @airport = nil
    true
  end

  # complete landing
  def land_plane airport
    @airport = airport
    @airport.on_land self
    true
  end

end
