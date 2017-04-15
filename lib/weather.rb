class Weather

  def initialize
    @conditions = [:sunny, :stormy]
  end

  def random_condition
    @conditions.sample
  end

end
