class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_to_take_off
    if empty?
      fail 'There are no planes at the airport'
    elsif stormy? == true
      fail 'The weather is too stormy to take off'
    else
      plane = @planes.pop
      @planes.delete(plane)
      plane.take_off
      plane
    end
  end

  def instruct_to_land(plane)
    if full?
      fail 'The airport is currently full'
    elsif stormy? == true
      fail 'The weather is too stormy to land'
    else
      plane.land
      @planes << plane
    end
  end


  private

  def stormy?
    if rand(10) >= 8
      true
    else
      false
    end
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end




end
