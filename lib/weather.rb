require_relative '../lib/plane'
require_relative '../lib/airport'

class Weather
  def stormy?
    rand(1..4) == 1
  end
end
