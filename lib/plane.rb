class Plane
  attr_reader :flying
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def land!
    fail 'Already Landed' unless flying
    @flying = false
  end

  def take_off!
    fail 'Already Flying' if flying
    @flying = true
  end
end
