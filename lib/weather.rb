require_relative 'airport'

class Weather
  def initialize(condition = (rand(100) >= 90))
    @condition = condition
  end

  def stormy?
    return @condition
  end

end
