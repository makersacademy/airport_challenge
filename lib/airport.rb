class Airport
  attr_reader :at_airport
  def initialize
    @at_airport = []
  end

  def stormy
    @stormy = true
  end

  def landing(plane)
    if @stormy == true
      "Too stormy!"
    elsif @at_airport.length == 20
      "Airport is full"
    else
      @at_airport.push(plane)
      print @at_airport
      plane
    end
  end

  def takeoff(plane)
    if @stormy == true
      "Too stormy!"
    else
      @at_airport.length.positive?
      @at_airport.shift[plane]
      @at_airport.length
    end

  end

end
