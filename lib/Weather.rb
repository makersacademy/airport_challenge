require_relative 'airport'
require_relative 'plane'

class Weather
  def stormy?
    rand(5) == 1 ? true : false
  end
end
