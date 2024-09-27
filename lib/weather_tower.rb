class WeatherTower

  def safe_to_fly?
    if rand(10) >= 9
      @safe_to_fly = true
    else
      @safe_to_fly = false
    end
    @safe_to_fly == true
  end

end
