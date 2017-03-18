class Plane

  attr_reader :flying

  def self.takeoff
    @flying = true
  end

  def self.land
    @flying = false
  end

end
