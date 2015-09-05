class Weather

  def initialize
    @forecast = self.forecast
  end

  attr_reader :status, :stormy, :sunny

  def forecast
    scale = rand(1..9)
    if scale <= 7
      sunny
      "Sunny today woohoo!"
    else
      stormy
      "Stormy today, fasten those seatbelts!"
    end
  end


end
