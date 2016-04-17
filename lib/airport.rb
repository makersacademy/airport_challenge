require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY= 20
    attr_accessor :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end
          # def airport_space
          #   @planes
          # end
          def accept_for_landing(plane)
            raise "Already landed" if any_landed?(plane)
            raise "Airport is full" if full?
            raise "It's too stormy to land" if stormy_weather?
            plane.reported_landed
            @planes << plane
          end
          def accept_for_take_off(plane)
            raise "There are no planes in the Airport" unless planes_inside?(plane)
            raise "the plane is no longer in the airport" unless any_landed?(plane)
            raise "It's too stormy to takeoff" if stormy_weather?
            plane.took_off?
            @planes.delete(plane) if planes_inside?(plane)
          end

   private

  attr_reader :planes

  def any_landed?(plane)
    plane.landed?
  end

  def planes_inside?(plane)
    @planes.include?(plane)
  end
    def full?
      @planes.length == capacity
    end

    def stormy_weather?
    Weather.new.stormy?
    end
end
