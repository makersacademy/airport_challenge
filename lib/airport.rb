class Airport
  attr_reader :planes, :capacity
  def initialize(capacity = 50)
    # later I want to change @planes from [] to {} to track them.
    @planes = []
    @capacity = capacity
  end

  def plane_lands(plane = '')
    if @planes.length == capacity
      fail 'THE AIRPORT IS FULL'
    elsif @weather == 'stormy'
      fail 'ITS STORMY'
    else
      @planes << plane
    end
  end

  def plane_takes_off(*)
    (@weather == 'stormy') ? (fail 'ITS STORMY') : @planes.pop
  end

  def full?
    @planes.length == capacity
  end

  def weather(*option)
    # 'stormy on rare occasions'. I will make it 10%
    option << (rand(10))
    @weather = (((option[0]) >= 9) ? 'stormy' : 'sunny')
  end
end
