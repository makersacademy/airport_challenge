class Weather
  attr_reader :weather

  def initialize

    @weather = set_conditions

  end

  def set_conditions

    get_weather < 2? 'stormy' : 'fine'

  end

  def get_weather

    rand(11)

  end


end
