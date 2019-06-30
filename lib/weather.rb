class Weather
  attr_reader :stormy

  def initialize
    @stormy = false
  end

  def stormy?
    @stormy = true
  end
end
