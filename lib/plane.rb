class Plane

  attr_reader :in_air
  attr_reader :in_airport
  attr_reader :airport_at

  def initialize(airports = false)
    @in_air = true
    @in_airport = airports
    @airport_at = ""
    @in_airport = false
  end

  def airport_in(airport)
    @airport_at = airport
  end

  def land_in_airport(airport)
    @airport_at = airport
    left_airport(true)
  end

  def land
    if @in_air == false
      raise "The plane has already landed!"
    end
    @in_air = false
  end

  def take_off
    unless @in_air == false
        # line change for rubocop
      raise "The plane is already in the air!"
    end
    unless @in_airport == true
        # line change for rubocop
      raise "You can't take off from nowhere! You must have crashed!"
    end
    @in_air = true
  end

  def left_airport(in_airports)
    @in_airport = in_airports
  end
end
