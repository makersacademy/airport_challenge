require 'plane'
require 'weather'


class Airport
    attr_reader :plane
    attr_accessor :hangar

    def initialize 
      @hangar = []  
    end

    def land(plane)
      @plane = plane
    end

    def take_off(plane)
      raise "We can't take off in stormy weather" if @stormy = true
      @hangar << plane
    end


  end