require_relative 'plane'

class Airport

  def initailize
    @terminal = []
  end

  def ATC plane
    fail 'No room, Airport is full' if full?
    @terminal << plane
  end

  def full?
    @terminal.count >= 5
  end

end
