class Plane

DEFAULT_CAPACITY = 0

  def initialize
    @runway = []
  end

    def land
      fail 'Do not land, the airport is full!' if full?
    end

  def depart
    return "Plane has left the airport"
  end

  private

    def full?
      @runway.count >= DEFAULT_CAPACITY
    end
end
