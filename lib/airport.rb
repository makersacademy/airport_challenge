class Airport
  def initialize(default_capacity = 10)
    @airport_deposit = []
    @default_capacity = default_capacity
  end

  def land(plane)
    raise Exception.new if full?
    @airport_deposit << plane
  end

  def take_off(plane)
    @airport_deposit.delete(plane) if @airport_deposit.include?(plane)
  end

  private

  def full? 
    # @airport_deposit.length >= @default_capacity ? true : false
    @airport_deposit.length >= @default_capacity # Returns true or false
  end

end
