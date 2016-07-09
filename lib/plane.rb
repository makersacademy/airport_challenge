class Plane

  attr_reader :flying

  def initialize(flying = true)
    @flying = flying
  end

  def land
    flying = false
  end

  def take_off
    flying = true
  end

  private

  attr_writer :flying
end
