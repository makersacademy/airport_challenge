class Stormy_Weather

  def report
    if generate_weather <= 2
      true
    else false
    end
  end

  def generate_weather
    rand(11)
  end

end
