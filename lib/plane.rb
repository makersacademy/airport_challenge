class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def takeoff
    self.flying = true
  end

  def land
    self.flying = false
  end

  private

  attr_writer :flying

end
