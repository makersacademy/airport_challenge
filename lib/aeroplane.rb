class Aeroplane
  attr_accessor :flying, :landed

  def intialize
    @flying = false
    @landed = true
  end

  def take_off
    return "Already flying!" if @flying == true
    @flying = true
    @landed = false
  end

  def land
    return "Already landed!" if @landed == true
    @landed = true
    @flying = false
  end
end
