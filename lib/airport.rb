class Airport

  def initialize(capacity = 1000)
    @capacity = capacity
  end

  def capacity
    @capacity
  end

  def airport_space
    parking_space = [0].sum
  end

  def airport_full?
    if parking_space == 0
      true
    else
      false
    end
  end

  def confirm_takeoff
    puts "Please confirm takeoff. Reply with 'yes' or 'no'"
    input = gets.chomp
    if input == "yes"
      "Takeoff confirmed"
      parking_space << 1
    else
      "Takeoff NOT confirmed"
    end
  end

end
