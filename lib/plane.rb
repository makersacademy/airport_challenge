class Plane
  attr_reader :weather

  def storm
   r = Random.new
   r.rand(10) > 8 ? @weather=true : @weather =false
  end

  def initialize
    @weather = true
  end
end

