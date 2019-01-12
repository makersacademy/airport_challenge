class Weather

  def weather
    generate_weather
  end

  private
  def generate_weather
    if rand(11) >= 9
      :stormy
    else
      :sunny
    end
  end

end
