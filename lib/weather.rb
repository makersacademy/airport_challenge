class Weather

  def stormy
  end

  def random_weather
    case rand(100) +1
      when 1..80 then return 'sunny'
      when 81..100 then return 'stormy'
    end
  end
end
