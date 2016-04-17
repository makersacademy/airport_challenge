require_relative 'plane'

class Airport
  DEFAULT_CAPACITY= 20
    attr_accessor :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end
    def airport_space
      @planes
    end
    def accept_for_landing(plane)
      raise "Airport is full" if full?
      # raise "It's too stormy to land" unless stormy? == false
      @planes << plane
      #  @planes.flatten!

    end
    def accept_for_take_off(plane)
    @planes.delete(plane)
    #raise "It's too stormy to takeoff" unless stormy? == false
    #  @planes
    end

    def stormy?
      if rand(10) > 6
        true
      else
        false
      end
    end


  private

    def full?
      @planes.count >= capacity
    end
end
