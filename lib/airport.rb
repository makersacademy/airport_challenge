
require 'plane'
require 'weather'



class Airport

include Weather

    DEFAULT_CAPACITY = 2
    attr_accessor :planes, :capacity, :weather

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @planes = []
       
    end


    def land(plane)
        raise "Stormy weather cannot land" if weather == "Stormy"
        raise "Plane is landed" if plane.flying? == false
        raise "The airport is full" if full?
        plane.land
        arrived(plane)
    end

    def take_off
        raise "It's stormy" if weather == "Stormy"
        raise "There are no planes" if @planes.empty?
        raise "Plane is flying" if plane.flying? == true
        plane.takeoff
        departed(plane)
    end
=begin
    def show_weather
        print weather
    end

#method used for printing for debugging
=end

private

    def arrived(plane)
        @planes << plane
    end

    def departed(plane)
        @planes.delete(plane)
    end

    def full?
        @planes.length >= @capacity
    end



end