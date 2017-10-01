class Aeroplane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def fly
    @landed = false
  end
  
end
