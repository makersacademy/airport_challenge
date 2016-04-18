class Weather
  attr_reader :storm

  def initialize
    @storm = false
  end

  def stormy?
     @storm = rand > 0.85
  end

end
