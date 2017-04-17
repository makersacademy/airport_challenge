class Weather

  CONDITIONS = [:sunny, :sunny, :sunny, :stormy]

  def condition_sample
    @conditions.sample
  end

  def stormy?
    random_condition == :stormy ? true : false
  end

end
