class Plane 
  def landed
    true
  end

  def check_weather
    @stormy = true 
  end
  
  def stormy?
    @stormy
  end
end
