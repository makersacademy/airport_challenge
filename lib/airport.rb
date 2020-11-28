class Airport

attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def arrival(plane)
    if @hangar.length < 5
      @hangar << plane
    else
      fail "The Airport is at capacity. No more planes can land."
    end
  end

  def depart(plane)
    @hangar.delete(plane)
  end

  def hangar
    @hangar
  end

end