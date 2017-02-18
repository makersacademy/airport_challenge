require_relative 'airport'
require_relative 'plane'
require_relative 'weather'

class Controller

def storm_error
weather = Weather.new
raise 'Weather is stormy, cannot land' if weather.stormy? == true
end

end
