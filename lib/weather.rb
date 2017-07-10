require_relative 'airport'

class Weather
  attr_reader :stormy

  def stormy
    forecast == true
  end

  private

  def forecast
    storm = [true, false, false, false].sample
  end

end
