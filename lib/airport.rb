require './lib/plane.rb'

class AirPort

attr_reader :hanger
attr_accessor :capacity
DEFAULT_CAP = 5

  def initialize(capacity = DEFAULT_CAP)
    @capacity = capacity
    @hanger = []
  end

  def land(plane)

     raise 'This plane is has already landed' unless plane.flying
  
       raise 'No room at airport' unless room_in_hanger?
         plane.landed_plane
         @hanger << (plane)
  end

  def take_off(plane)

    raise 'This plane is not landed here' unless @hanger.include?(plane) && !(plane.flying)
      plane.starts_flying
      @hanger.delete(plane)
  
  end


  def room_in_hanger?

   if @hanger.length < DEFAULT_CAP
    true
   end

  end

end

# irb -r './lib/airport.rb'