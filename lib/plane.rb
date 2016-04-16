class Plane
  attr_reader :landed
  def storm
   r = Random.new
   r.rand(10) > 8 ? true : false
  end

  def initialize
    @landed = false
  end

  def land(airport)
    @landed=true
    @airport= airport
  end

  def take_off(airport)
    @airport= airport
    if storm
      @landed=true
      raise "can't fly win storm"
    else
      @landed=false
    end
  end
end

