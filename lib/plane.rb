class Plane
  def initialize
    @in_air = true
  end
  attr_reader :in_air

  def landed?
    @in_air = false
  end
  def taken_off?
    @in_air = true
  end  
end
