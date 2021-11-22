require_relative 'plane'
require_relative 'airport'

class Weather

def stormy?
  x = rand(100)
  if x < 2
    "true"
  else
    "false"
  end
end

end

