class Weather
  def stormy?
    random_condition == :stormy
  end

private

  def random_condition
    conditions = [:stormy, :sunny, :sunny, :sunny]
    conditions.sample
  end
end
