require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  DEFAULT_CAPACITY= 20
    attr_reader :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end

          def accept_for_landing(plane)
            raise "Already landed" if landed_in?(plane) == true
            raise "Airport is full" if full?
            raise "It's too stormy to land" if stormy_weather?
            plane.landed
            @planes << plane

          end
          def accept_for_take_off(plane)
            raise "There are no planes in the Airport" if @planes.empty?
            raise "the plane is no longer in the airport" unless plane.landed? == true
            raise "It's too stormy to takeoff" if stormy_weather?
            plane.took_off
            @planes.delete(plane)

          end

   private

  def landed_in?(plane)
    @planes.include?(plane)
  end

    def full?
      @planes.count >= capacity
    end

    def stormy_weather?
      Weather.new.stormy?
    end
end
