class Weather

  def initialize
  @CONDITIONS = [:stormy, :sunny, :rain, :clear]
  end

  def set_conditions
    n = rand(0..2)
    @CONDITIONS[n]
  end

  def stormy?
    set_conditions == :stormy
  end

end
