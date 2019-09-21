class Weather

attr_reader :stormy

  def initialize
    rand_weather = rand(1..6)
    #random number generator used to randomly select if weather is stormy.
    if rand_weather > 4
      @stormy = true
    else
      @stormy = false
    end
  end

  def stormy?
    @stormy
  end

end
