require 'plane'
require 'weather'


class Airport
    attr_accessor :hangar

    def initialize 
      @hangar = []  
      
    end

    def land(plane)
      @hangar << plane
    end

    def take_off(plane)
      hangar.pop
      raise 'Plane has taken off' if hangar.length == 0
      @hanger.delete(plane)
    end


  end