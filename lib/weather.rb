require_relative "airport"

class Weather
  
  def rng
    @random_number = rand(100)
    sunny if @random_number >= 50
  end

  def sunny
    "Fly away, baby"
  end
  
  def stormy
    "Stay put"
  end
end