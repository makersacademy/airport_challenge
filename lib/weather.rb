class Weather
  attr_reader :weather

  CURRENT_CONDITIONS = [:clear, :stormy]

  def initialize
    @weather = CURRENT_CONDITIONS.sample
  end

  def stormy?
    @weather == :stormy
  end

end
