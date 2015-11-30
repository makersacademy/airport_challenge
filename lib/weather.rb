class Weather
  attr_reader :stormy

  def initialize
    @stormy = true if rand(2) == 1
  end

end
