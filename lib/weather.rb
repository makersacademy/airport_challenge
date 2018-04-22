class Weather

  attr_reader :stormy, :fine

  def stormy?
    random_condition == :stormy
  end

  private

  CONDITIONS = [:stormy, :fine, :fine, :fine, :fine]

  def random_condition
    CONDITIONS.sample
  end

end
