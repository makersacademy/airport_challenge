class Weather

  attr_reader :sunny
  attr_reader :stormy

  def initialize
    @sunny = sunny
    @stormy = stormy
  end

  def prediction
    rand(1..10)
  end

  def forecast
    if prediction == 1..8
      @sunny
    else
      @stormy
    end
  end

end
