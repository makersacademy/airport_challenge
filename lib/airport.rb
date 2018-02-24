class Plane

end

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    puts "#{plane} has landed in Manises airport and is ready for inspection."
    @hangar << plane
  end

  def take_off(plane)
    @hangar -= [plane]
  end

  def confirmation_of_departure(plane)
    if @hangar.include? plane fail "The #{plane} did not take off"
    else
      puts "Control Tower confirming the departure of #{plane}"
    end
  end

end
