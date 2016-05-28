class Aeroplane
  attr_reader :landed
  
  def initialize
    @landed = false
  end

  def set_landed
    @landed = true
  end
  
  def landed?
    @landed
  end

end
