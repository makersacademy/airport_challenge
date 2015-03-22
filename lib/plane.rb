class Plane
  attr_reader :flying
  alias_method :airborne?, :flying

  def initialize(options = {})
    @flying = options[:airborne]
  end

  def take_off
    @flying = true
    self
  end

  def land
    @flying = false
    self
  end

  private

  def defaults
    { airborne: true }
  end
end
