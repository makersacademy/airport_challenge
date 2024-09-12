require_relative 'airport'
require_relative 'weather'


class Plane
    
    def initialize
      conditions = Weather.new
      @weather = conditions
    end

    def land
        if @weather.sunny?
            'land'
        else
            'cannot land'
        end
    end

    def take_off
        if @weather.sunny?
          "the plane is off"
        else
            'canno take off'
        end
    end

end