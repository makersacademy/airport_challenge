class Weather

  attr_accessor :weather_generator
  attr_reader :randomizer

  def randomizer
    Kernel.rand(100).to_i
  end

  def weather_generator
    rs = randomizer
    if rs >= 75
      true
    else
    false
    end
  end
end
