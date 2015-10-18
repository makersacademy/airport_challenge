class Plane

  def initialize
    @flying = true
  end

  def instructed_to_land
    raise "Not flying" if !flying?
    @flying = false
  end

  def instructed_to_take_off
    raise "Already flying" if flying?
    @flying = true
  end

  private
  def flying?
    return @flying
  end
end