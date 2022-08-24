class Plane

  def initialize
    @flying = true
  end

  def land
    raise "NotFlying" unless flying?
    @flying = false 
    self
  end

  def take_off 
    raise "AlreadyFlying" if flying?
    @flying = true
    self
  end

  private

  def flying?
    @flying
  end
end

# https://www.jimmycuadra.com/posts/self-in-ruby/
# used this website to unserstand and use "Self"