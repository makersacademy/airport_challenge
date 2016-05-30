class Plane

  attr_reader :in_flight

  def initialize(flying = true)
    @in_flight = flying
  end

  def airbourne
    self.in_flight = true
  end

  def landed
    self.in_flight = false
  end

  private
  attr_writer :in_flight


end
