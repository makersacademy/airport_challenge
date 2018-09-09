class Weather

  attr_reader :stormy_probability

  def initialize(stormy_probability = 0.5)
    @stormy_probability = stormy_probability
  end

  def stormy?
    rand < stormy_probability
  end

end
