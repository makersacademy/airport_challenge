DEFAULT_CAPACITY = 20

class Airport

    attr_reader :hangar, :capacity

    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @hangar = []
    end

    def takeoff
      if empty? == true
        fail("No planes are available to fly(?!)")
      elsif stormy? == true
        "It's too stormy to fly..."
      else
        @hangar.pop
        "We have lift-off!"
      end
    end

    def land(plane)
      if full? == true
        fail("This airport's hangar is full..hope you don't mind driving from the next airport over!")
      elsif stormy? == true
        "It's too stormy to land..."
      else
          @hangar << plane
          "The plane has landed!"
      end
    end

    def stormy?
      weather = rand(100)
      if weather <= 5
        true
      else
        false
      end
    end

    def full?
      if @hangar.length >= @capacity
        true
      else
        false
      end
    end

    def empty?
      if @hangar.length == 0
        true
      else
        false
      end
    end
  end
