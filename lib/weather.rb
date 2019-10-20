require_relative 'airport'
require_relative 'plane'

class Weather

attr_accessor :stormy

def stormy
  @weather = [true, false].sample
end

end
