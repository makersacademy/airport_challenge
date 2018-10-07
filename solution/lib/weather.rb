class Weather

attr_reader :condition

  def initialize
   conditions = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
    @condition = conditions[rand(conditions.length - 1)]
  end

end
