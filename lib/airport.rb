class Airport

attr_accessor :hangar

  def initialize(capacity = 10)
    @capacity = capacity
    @hangar = [].take(@capacity)
  end

  def arrival(plane)
    if @hangar.length < @capacity
      p "#{plane} has now landed at the terminal."
      @hangar << plane
    else
      fail "The Airport is at capacity. No more planes can land."
    end
  end

  def depart(plane)
    p "#{plane} has now departed for its destination."
    @hangar.delete(plane)
  end

  def hangar
    @hangar
  end

end