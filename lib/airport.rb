require_relative 'plane' #Airport class has lots of extra
                        #functionality that *should* be in Plane
class Airport
  DEFAULT_CAPACITY = 3
  attr_reader :planes, :capacity
  attr_accessor :stormy

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = (rand 100) > 25 ? false : true  #25% chance of storm on initialization. Should be in a separate Weather class.
    # @stormy = false
    @capacity = capacity
  end


  def report_stormy  #allows user to set weather to stormy. Not really necessary,
    @stormy = true    #will remove on further refactor.
  end

  def take_off
    raise 'Sorry, no taking off in stormy weather' if stormy
    planes[planes.count - 1].fly  #could plane.last.fly accomplish the same thing?
    planes.pop
  end

  def land(plane)
    raise 'That plane is already on the ground!' if plane.landed  #these guards should be pulled out into
    raise 'Sorry, no landing in stormy weather' if stormy         #their own method. SRP!!!
    raise 'Sorry, the airport is full' if planes.count >= capacity
    plane.land
    planes << plane
  end
end
