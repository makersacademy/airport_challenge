class Plane

  attr_accessor :flying
  attr_accessor :landed

  def initialize
    @flying = true
    #@landed = false

  end

  def flying?
    flying
  end

  def land
    #self.landed = true
    self.flying = false
  end

  def landed?
    #flying = true
    not flying
  end

  def take_off
    self.flying = true
    #self.landed = false
  end




end
