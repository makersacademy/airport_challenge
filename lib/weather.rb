require_relative 'airport'
require_relative 'plane'

class Weather

attr_accessor :stormy
attr_accessor :weather

def stormy
  [true, false].sample
end

end
