require_relative "airport.rb"

class Plane

  def initialize
    @in_air = true
  end

  def prepare_landing(airport)
    raise "Aircraft can not landed as it has already arrived" if landed
    @in_air = false
    @airport = airport
  end

  def depart
    raise "Aircraft can not depart as it has already departed" if departed
    @in_air = true
  end

  def airport
    @airport
  end

  private

  def landed
    @in_air = false
  end

  def departed
    @in_air = true
  end

end
