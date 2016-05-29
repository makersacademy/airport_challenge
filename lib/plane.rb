class Plane

  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def in_flight
    self.flying = true
  end

  def landed
    self.flying = false
  end

  private
  attr_writer :flying


end
