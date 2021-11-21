class Airport
  def initialize(capacity = 20)
    @capacity = capacity
    @hanger = []
  end

  def hanger_full?
    return @hanger.length == @capacity
  end
end
