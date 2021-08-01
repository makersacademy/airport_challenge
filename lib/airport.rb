class Airport
  
  def initialize
  @airport = []
  end
  
  def full
    fail "airport is full, this plane cannot land" if @airport != []
  end

end
