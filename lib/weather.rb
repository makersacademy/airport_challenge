class Weather

  def initialize(condition = rand(1..100))
    @condition = condition
  end

  def good?
    @condition > 20
  end
end
