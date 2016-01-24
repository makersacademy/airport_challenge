require_relative 'weather.rb'

class Plane

  def initialize
    @in_air = true
  end

  def plane_take_off
    fail "The plane is already in the air" if @in_air
    @in_air = true
  end

  def plane_landed
    fail "The plane has already landed" if @in_air == false
    @in_air = false
  end

  def not_in_air?
    @not_in_air = true
    @in_air = false
  end

  def in_air?
    @in_air = true
  end

end
