class Plane

  attr_accessor :flying
  attr_accessor :landed

  def initialize
    @flying = true
    @landed = false

  end

  def flying?
    flying
  end

  def land
    self.flying = false
    self.landed = true
    #or flying = false self
  end

  def landed?
    flying = false
    landed = true
  end

  def take_off
    self.landed = false
    self.flying = true
  end




end
