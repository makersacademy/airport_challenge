module Weather

  attr_reader :weather_warning

  def weather_warning
    rand(100) > 80 ? "Stormy" : "Fine"
  end

end
