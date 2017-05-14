class Weather

  CONDITIONS = [:sunny, :sunny, :sunny, :stormy]

  def random_condition
    CONDITIONS.sample
  end

  def stormy?
    random_condition == :stormy ? true : false
  end

end
