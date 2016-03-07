class Plane
  attr_reader :landed, :taken_off
  
  def initialize
   @landed = false
   @taken_off = false
  end

  def land
    raise "hmmm, it looks like we have that plane down as already landed, can you check the reference" if landed
    @landed = true
    @taken_off = false
  end


  def take_off
    raise "hmmm, it looks like we have that plane down as not landed, can you check the reference" if @landed == false
    @landed = false
    @taken_off = true
  end

end
