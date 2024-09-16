class Airport
  attr_reader :planes, :capacity #:name
  attr_accessor :stormy

  def initialize(capacity = 5)
    # 90% sunny and 10% of the time stormy
    rand() > 0.9 ? @stormy = true : @stormy = false
    #@name = name
    @capacity = capacity
    @planes = []
  end
end
