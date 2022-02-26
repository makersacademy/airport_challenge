class Airport
  def initialize(default_capacity = 10)
    @airport_deposit = []
    @CAPACITY = default_capacity
  end

  def land(plane)
    if full?
      raise Exception.new
    else
      @airport_deposit << plane
    end
  end

  def take_off(plane)
    return @airport_deposit.delete(plane) if @airport_deposit.include?(plane)
  end

  private

  def full? 
    @airport_deposit.length >= @CAPACITY ? true : false
  end

end
