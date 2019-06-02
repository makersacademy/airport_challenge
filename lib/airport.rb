
class Airport

  def initialize(capacity = 5)
    @capacity = capacity
    @planes = [1]
  end

    def land(plane)
      if @planes.length < @capacity
          @planes << plane
        true
      else
        false
      end
    end
      def take_off(plane)
        if @planes.length > 0
           @planes.pop
            true
        else
         false
       end
      end

end
