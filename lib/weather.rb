class Weather
  attr_reader :weather

  def initialize
    @weather = conditions.sample
  end

  def conditions
    ["sunny", "sunny", "stormy", "sunny", "sunny", "stormy"]
  end
end
