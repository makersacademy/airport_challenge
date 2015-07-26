require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

  def take_off?
    fail 'Can not take off' if @weather = "stormy"
    fail 'Can not take off' if empty?
    @planes.pop
  end

   def landing?
     fail 'Can not land plane' if @weather = "stormy"
     planes << plane
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

  def empty?
    planes.empty?
  end

end
