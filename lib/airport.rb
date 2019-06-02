require './lib/weather.rb'

class Airport
@weather = Weather.new
  def initialize(capacity = 5)
    @capacity = capacity
    @planes = []
  end

 def full?
   @planes.length >= @capacity
 end

    def land(plane)
      return false if full?
       @planes << plane
    end

      def take_off(plane)
        if @weather = "stormy"
          false
        else
          if @planes.length > 0
            @planes.pop
            true
          else
            false
        end
       end
      end

end
