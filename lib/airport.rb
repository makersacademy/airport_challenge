require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

  def take_off?
    fail 'Can not land plane' if @weather = "stormy"
  end

   def landing?
     fail 'Can not land plane' if @weather = "stormy"
   end

  def airport plane
    fail 'Airport is full' if full?
    planes << plane
  end

  def weather?
    @weather = ["stormy", "sunny", "sunny", "sunny", "sunny", "sunny"].sample
  end

  private

  attr_reader :planes

  def full?
    planes.count >=@capacity
  end

end
