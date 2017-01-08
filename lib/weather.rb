class Weather

  def current_weather
    condition <= 5 ? "stormy" : "sunny"
  end

  private

  def condition
    rand(100)
  end

end
