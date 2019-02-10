class Airport
  attr_reader :at_airport
  attr_reader :capacity
  def initialize
    @at_airport = []
    puts "Enter capacity number:"
    @capacity = gets.chomp.to_i
  end

  def stormy
    @stormy = true
  end

  def landing(plane)
    if @stormy == true
      "Too stormy!"
    elsif @at_airport.length == @capacity
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
