class Weather
  attr_reader :stormy
  def initialize
    @stormy = rand(10) == 1 ? true : false
  end
end
