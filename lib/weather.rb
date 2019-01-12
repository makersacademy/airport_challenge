class Weather

  def current_weather?
    return "sunny" if rand.(1..10).between?(1, 8)
    "stormy"
  end

end
