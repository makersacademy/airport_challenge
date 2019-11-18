class Airport
  attr_reader :planes, :capacity
  attr_accessor :stormy

  def initialize(capacity = 5)
    # 90% sunny and 10% of the time stormy
    rand() > 0.9 ? @stormy = true : @stormy = false
    @capacity = capacity
    @planes = []
  end
  # def stormy(boolean)
  #   @stormy = boolean
  # end
end
