class Weather
  def stormy?
    conditions = [:stormy, :sunny, :sunny, :sunny]
    conditions[chance-1] == :stormy
  end

  private
  def chance
    rand(4)
  end
end
