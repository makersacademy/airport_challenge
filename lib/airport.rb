require './lib/plane'

class Airport
  attr_reader :plane

  def take_off
    fail "No planes available to fly" unless @plane
    #the return below is not currently tested, how can I do this?
    @plane
  end

  def land(plane)
    fail "Aiport full, cannot land!" if @plane
    @plane = plane
  end


  #technically below is the attribute reader
  #def plane
  #  @plane
  #end
end
