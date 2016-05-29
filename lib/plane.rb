require_relative "airport.rb"

class Plane

  def initialize
    @in_air = true
  end

  def land
    fail "Plane can not land as it is already on the ground" if already_landed?
    @in_air = false
  end

  def depart
    fail "Plane can not depart as it has already departed" if already_departed?
    @in_air = true
  end

  private

  def already_landed?
    @in_air == false
  end

  def already_departed?
    @in_air == true
  end

end
