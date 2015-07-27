require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

    def initialize(capacity= DEFAULT_CAPACITY)
      @airport = []
      @capacity = capacity
    end

  def take_off?
    fail 'Can not take off' if @weather = "stormy"
    fail 'Can not take off' if empty?

    if plane.can_take_off?
      plane.taken_off? == true
      @airport.delete[plane]
    end
  end

   def landing? (plane= Plane.new)
     fail 'Can not land plane' if @weather = "stormy"
     fail 'Can not land plane' if full?

     if plane.can_land?
       airport << plane
       plane.has_landed? == true
     end
   end

  def weather?
    @weather = ["stormy", "sunny", "sunny", "sunny", "sunny", "sunny"].sample
  end

  private

  attr_reader :planes

  def full?
    airport.count >=@capacity
  end

  def empty?
    airport.empty?
  end
end
