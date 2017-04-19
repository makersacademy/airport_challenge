class Weather

  def initialize
    forecast
  end

  def forecast
     OUTLOOK.sample
  end

  def stormy?
    forecast == :stormy
  end

  private

  OUTLOOK = [:stormy, :fine, :fine, :fine]

end
