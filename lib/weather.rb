class Weather
  attr_reader :weather

  def weather
    num = rand
    if num > 0.8 
      return "stormy"
    else
      return "sunny"
    end
  end
end