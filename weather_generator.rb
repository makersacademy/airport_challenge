class weather
  attr_reader :weather

  def weather?
    weather = rand(1..5)
    return "Storm" if weather > 4
    return "Clear"
  end
end
