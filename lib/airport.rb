require './lib/plane'

class Airport
  attr_reader :num_planes
  attr_reader :capacity
  self::MAX_PLANES = 10

  def initialize#(capacity)
    @num_planes = []
    @capacity = MAX_PLANES #capacity
  end

  def take_off
    fail "No planes available to fly" if @num_planes.empty? #removed unless
    #the return below is not currently tested, how can I do this?
    @num_planes.pop
  end

  def land(plane)
    fail "Aiport full, cannot land!" if @num_planes.count >= MAX_PLANES
    @num_planes.push(plane) # =plane
  end


  #technically below is the attribute reader
  #def plane
  #  @plane
  #end
end
