require 'airport'
class StormyWeather < StandardError
  def initialize(message)
    super(message)
  end
end

class Weather
  def stormy?
    h = { 1 => "no", 2 => "no", 3 => "no", 4 => "no", 5 => "yes", 
     6 => "no", 7 => "no", 8 => "no", 9 => "no", 10 => "yes"
    }
    stormy = h.values
    p stormy[rand(stormy.size)]
  end
end
