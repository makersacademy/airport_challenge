class Weather

  def weather_condition
    number = rand(1..100)
    if number.between?(1, 80)
      :sunny
    elsif number.between?(81, 100)
      :stormy
    end
  end

end
