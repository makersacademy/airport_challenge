class Plane
  attr_accessor :landed ,:takenoff
  alias :landed? :landed
  alias :takenoff? :takenoff

  def initialize
    @landed = true
    @takenoff = false
  end

  def landed?
    @landed
  end

  def takenoff?
    @takenoff
  end

end
