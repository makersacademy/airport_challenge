module WEATHER

  def bad_weather?
    decimal = rand
    return decimal.round ? true : false
  end

end
