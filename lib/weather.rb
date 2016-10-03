require_relative 'plane'
require_relative 'airport'

class Weather

attr_accessor :stormy

  def chance
    rand(10)
  end

  def weather
    @stormy = true if chance >= 7
  end

end
