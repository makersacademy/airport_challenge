class Weather

  def initialize
    @forecast = self.forecast
  end

  attr_reader :status, :sunny

  def stormy?
    true
  end

  def forecast
    scale = rand(1..9)
    if scale <= 7
      sunny
    else
      stormy
    end
  end


end
