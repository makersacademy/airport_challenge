class Plane

attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    raise "This plane has already landed" if landed
    @landed = true
  end

  def take_off
    raise "This plane is not in the airport" unless landed
    @landed = false
  end

end
