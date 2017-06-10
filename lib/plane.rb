require_relative "../lib/airport.rb"

class Plane

  def landed?
    @landed
  end

  def land
    @landed = true
  end

end
