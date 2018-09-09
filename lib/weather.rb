# This class generates the weather conditions (stormy or not stormy), and takes
# an optional parameter of the probability of storms.
class Weather

  attr_reader :stormy_probability

  def initialize(stormy_probability = 0.5)
    @stormy_probability = stormy_probability
  end

  def stormy?
    rand < stormy_probability
  end

end
