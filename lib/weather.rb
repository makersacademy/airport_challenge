class Weather

  def initialize
    @conditions = [:sunny, :sunny, :sunny, :sunny, :sunny, :stormy]
  end

  def random_condition
    @conditions.sample
  end

end
