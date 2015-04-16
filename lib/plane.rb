class Plane
  def initialize
  end
  attr_reader :flying

  def status
    flying? ? :flying : :landed
    # if flying? :flying  else :landed
  end

  def land?
    @flying = false
  end

  def take_off
    @flying = true
  end
end
