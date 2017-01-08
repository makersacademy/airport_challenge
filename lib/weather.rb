class Weather
  def initialize
    @stormy = rand < 0.15
  end

  attr_reader :stormy
end
