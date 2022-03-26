class Weather
  attr_reader :stormy

  def initialize
    rand(10) > 0 ? @stormy = false : @stormy = true
  end
end