class Weather
  attr_reader :conditions

  def initialize
    @conditions = [1, 0, 0, 0, 0]
  end

  def stormy?
    @conditions.sample
  end

end
