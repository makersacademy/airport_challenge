class Weather

  def stormy?
    conditions = [:sunny, :cloudy, :sunny, :windy, :stormy]
    index = Random.rand(5)
    conditions[index] == :stormy
  end
end
