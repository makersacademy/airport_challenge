class Plane

  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def in_flight
    flying = true
  end

  def landed
    flying = false
  end

  private
  attr_writer :flying


end
