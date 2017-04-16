class Weather

  def initialize
    @conditions = [:sunny, :sunny, :sunny, :stormy]
  end

  def random_condition
    @conditions.sample
  end

  def stormy?
    random_condition == :stormy ? true : false
  end

end
