class Planes
  attr_reader :landed

  def initialize
    @landed = true
  end

  def take_off
    self.landed = false
  end

  def land
    self.landed = true
  end

  private
  attr_writer :landed

end
