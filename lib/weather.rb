require_relative "airport"

class Weather
  
  def rng
    random_number = rand(100)
    random_number >= 10 ? sunny : stormy
  end

  def sunny
    "Fly away, baby"
  end
  
  def stormy
    "Stormy"
  end
end
