class Weather
  attr_reader :stormy

  def initialize
    rand(10).zero? ? @stormy = true : @stormy = false
  end
end
