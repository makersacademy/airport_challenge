class Weather

  def initialize
  @CONDITIONS = [:sunny,:stormy, :rain, :clear]
  end

  def set_conditions
    n = rand(0..3)
    @CONDITIONS[n]
  end

  def stormy?
    set_conditions == :stormy
  end

end
