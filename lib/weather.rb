
class Weather
  attr_reader :stormy

  def stormy?
    @stormy = [false, false, false, false, true].sample
  end
end
