require_relative 'airport'
require_relative 'plane'

class Weather
  def stormy?
    rand(6) == 5
  end
end
