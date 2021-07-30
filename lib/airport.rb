class Airport
  attr_accessor :capacity

  def initialize capacity = 1
    @capacity = capacity >= 0 ? capacity : 1
  end
end