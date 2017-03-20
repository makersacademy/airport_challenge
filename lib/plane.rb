class Plane

  attr_reader :landed

  def initialize()
    @landed = false
  end

  def in_airport?
    landed == true ? true : false
  end

  def land
    self.landed = true
  end

  def take_off
    self.landed = false
  end

  private

  attr_writer :landed

end
