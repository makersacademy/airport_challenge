require_relative 'weather.rb'

class Plane

  def initialize
    @in_air = true
    @at_airport = false
  end

  def plane_take_off(airport)
    fail "The plane is already in the air" if @in_air
    @in_air = true
    @at_airport = false
    @airport = airport
  end

  def plane_landed(airport)
    fail "The plane has already landed" if @in_air == false
    @in_air = false
    @at_airport = true
    @not_in_air = true
    @airport = airport
  end

  def at_airport
    fail "The plane is in the air" unless @at_airport
    @in_air = false
    @at_airport = true
  end

  def landed?
    @at_airport
  end

  def flying?
    @in_air
  end

  def in_air?
    @at_airport = false
    @in_air = true
  end

end
