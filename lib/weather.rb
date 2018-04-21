module Weather

  def stormy?
    generate_weather
  end

  private
  
  def generate_weather
    rand(10) > 7 ? true : false
  end

end
