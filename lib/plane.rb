class Plane

  attr_reader :landed

  def storm
     @weather = rand(10) > 8 ? true : false
  end

  def initialize
    @weather = false
    @landed = false
  end
  def ground
    @landed = true
  end


end

