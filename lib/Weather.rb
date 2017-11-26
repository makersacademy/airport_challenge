require_relative 'Airport'
require_relative 'Plane'

class Weather
  def stormy?
    rand(5) == 1 ? true : false
  end
end
