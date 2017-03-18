class Weather
  attr_reader :stormy

  def initialize
    @stormy = false
  end

# change to random sunny or stormy generator later
  def stormy?
    @stormy = [true, false].sample
  end

end
