class Plane
  attr_accessor :weather

  def storm
   r = Random.new
   r.rand(10) > 8 ? @weather=true : @weather =false
  end

  def initialize
    @weather = false
  end

end

