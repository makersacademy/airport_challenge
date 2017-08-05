

class Aeroplane

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
      @airport = airport
      return true
    end

  end

  def try_take_off weather = Weather.generate

    if weather != $sunny then
      puts "Aeroplane can't take off in #{weather} weather."
      return false

    else
      puts "Aeroplane took off from airport!"
      @airport = nil
      return true
    end

  end

  def in_airport?
    @airport != nil
  end

end
