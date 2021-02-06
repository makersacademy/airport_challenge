class Airport

  attr_reader :hangar, :capacity

  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
  end

end
