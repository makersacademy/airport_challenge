class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def land!
    fail 'Already Landed' unless @flying
    @flying = false
  end

  def fly!
    fail 'Already Flying' if @flying
    @flying = true
  end
end
