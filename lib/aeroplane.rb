
class Aeroplane

  attr_accessor :airport

  def initialize
    # plane starts in the air
    @airport = nil
  end

  def try_land airport, weather = Weather.generate

    # make sure the plane is not already landed
    return already_landed unless @airport.nil?

    # make sure there is space to land, it it is, can't land
    return airport_full if airport.full?

    # make sure it is sunny, if not, can't land
    return bad_weather "land" unless weather == $sunny

    # ok to land
    puts "Aeroplane landed at airport!"
    land_plane airport

  end

  def try_take_off weather = Weather.generate

    # make sure the plane is at an airport
    if @airport.nil? then puts "Plane is not at an airport" end

    # make sure it is sunny, if not, can't land
    return bad_weather "take off" unless weather == $sunny

    # ok to land
    puts "Aeroplane took off from airport!"
    take_off

  end

  # returns true is plane is currently at an airport
  def in_airport?
    @airport != nil
  end

  private

  def already_landed
    puts "The plane is already at an airport"
    false
  end

  def airport_full
    puts "Airport is currently full!"
    false
  end

  def bad_weather action
    puts "Aeroplane can't #{action} in stormy weather."
    false
  end

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
