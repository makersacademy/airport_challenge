class Weather

  def bad_weather?
    decimal = rand(0...10)
    decimal < 5 ? true : false
  end

end
