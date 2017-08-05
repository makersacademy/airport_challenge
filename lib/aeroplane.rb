

class Aeroplane

  attr_accessor :airport

  def initialize
    @airport = nil
  end

  def try_land airport, weather = Weather.generate

    if airport.full? then
      puts "Airport is currently full!"
      return false

    elsif weather != $sunny
      puts "Aeroplane can't land in #{weather} weather."
      return false

    else
      puts "Aeroplane landed at airport!"
      land_plane airport
    end

  end

  def try_take_off weather = Weather.generate

    if airport.nil? then puts "Plane is not at an airport" end

    if weather != $sunny then
      puts "Aeroplane can't take off in #{weather} weather."
      return false

    else
      puts "Aeroplane took off from airport!"
      take_off
    end

  end

  def in_airport?
    @airport != nil
  end

  private
  def take_off
    @airport.on_take_off self
    @airport = nil
    true
  end

  def land_plane airport
    @airport = airport
    @airport.on_land self
    true
  end

end
