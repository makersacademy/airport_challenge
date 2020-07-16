class Airport
attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'No space to land the plane' if full?
    raise 'You can not land in a storm' if weather?
    @planes.push(plane)
  end

  def take_off
    raise 'There are no planes available' if @planes.empty?
    raise 'You can not take off in a storm' if weather?
    @planes.shift
  end


  private

  def full?
    if @planes.count >= @capacity
      true
    else
      false
    end
  end

  def weather?
    check = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"].sample
    if check == "sunny"
      false
    else
      true
    end
  end
end
