class Airport
  attr_accessor :hanger, :capacity
  def initialize(capacity = 1)
    @hanger = []
    @capacity = capacity
  end

  def change_capacity(capacity)
    @capacity = capacity
  end  

  def full?
    true if @hanger.length == @capacity
  end  
end
