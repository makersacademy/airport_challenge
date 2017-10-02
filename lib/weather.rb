class Weather
  attr_reader :stormy
  def initialize
    @stormy = rand(11).zero?
  end
end
