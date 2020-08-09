class Weather
  attr_reader :weather

  def initialize
  	@weather = current_conditions
  end

  def current_conditions
    i = rand(1..10)
    if i < 8
  	  return "sunny"
    else
  	  return "stormy"
    end

  end

end