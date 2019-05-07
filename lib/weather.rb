class Weather
  def check
    chance = rand(5)
    
    case chance
    when 1
      'stormy'
    else
      'clear'
    end
  end
end
