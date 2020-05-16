class Weather
  def stormy?
    # generate_weather == 'stormy'
    false
  end

  private

  def generate_weather
    case rand(1..100)
      when 1..80 then 'sunny'
      else 'stormy'
    end
  end
end
