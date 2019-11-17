class Weather
  attr_reader :stormy
  def initialize(stormy = false)
    @stormy = stormy
  end
end
