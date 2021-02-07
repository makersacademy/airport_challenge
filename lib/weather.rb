module Weather
  def report(condition = Condition)
    condition.rand() < 0.8 ? :clear : :stormy
  end
end
