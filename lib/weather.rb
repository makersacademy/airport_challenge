class Weather
  def stormy?
    random_condition == :stormy
  end

  def random_condition
    conditions = [:stormy, :sunny, :sunny, :sunny]
    conditions.sample
  end
end
