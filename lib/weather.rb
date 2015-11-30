class Weather
  attr_reader :stormy

  def initialize
    @stormy = true if rand(10) == 7
  end

end
