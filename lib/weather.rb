# randomly sets the weather condition between sunny and stormy

class Weather
  attr_accessor :stormy

  def storm
    rand1 = Random.new
    storm_chance = rand1.rand(1..100)
    if storm_chance > 90
      @stormy = true
    else
      @stormy = false
    end
  end

end
