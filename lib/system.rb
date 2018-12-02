require_relative "./weather"
require_relative "./airport"
require_relative "./plane"

module System
  class SystemControl

    def initialize(airport_origin, airport_destination, plane)
      @airport_origin = airport_origin
      @airport_destination = airport_destination
      @plane = plane
      @weather = Weather.new
    end

    def land
      if @weather.sunny?(@weather.forecast) &&
         @airport_destination.landing_possibility? &&
         @plane.flying?
        @airport_destination.landed_planes += 1
        "You can land"
      else
        "You cannot land"
      end
    end

    def take_off
      if @weather.sunny?(@weather.forecast) &&
        @airport_origin.name != @airport_destination.name &&
        @plane.landed?
        @airport_origin.landed_planes -= 1
        "You can take_off"
      else
        "You cannot take_off"
      end
    end

  end
end
