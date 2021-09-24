class Weather
  attr_reader :stormy

  def initialize
    @stormy = stormy?
  end

  def stormy?
    rand(2) == 1
  end
end
