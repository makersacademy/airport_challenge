class Weather
  attr_reader :stormy

  def initialize
    stormy = rand(0..100)
    @stormy = true if stormy >= 85
    @stormy = false
  end

end
