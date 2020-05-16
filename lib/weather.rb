class Weather

  def initialize
    @conditions = ["sunny", "sunny", "sunny", "stormy", "sunny"]
  end

  def check_conditions
    @conditions.sample
  end

end