require_relative 'airport'

class Weather

  def stormy?
    forecast == true
  end

  private

  def forecast
    storm = [true, false].sample
  end

end
