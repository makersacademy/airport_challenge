# Weather class definition
class Weather
  def initialize
    # creating array of stormy conditions 1/5 chances of storm
    @stormy = [false, true, false, false, false]
  end

  def stormy?
    @stormy.sample
  end
end
