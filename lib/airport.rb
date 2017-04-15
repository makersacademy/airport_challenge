require_relative './safety'

class Airport
  include Safety
  attr_reader :name, :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def landing_confirm(plane)
    if plane_present(plane) == true
      "Confirmed: #{plane.name} has landed in #{name}"
    else
      "Negative :#{plane.name} has not landed in #{name}"
    end
  end

  def take_off_confirmation(plane)
    if (plane_present(plane) == false) && (plane.status == "airborne")
      "Confirmed: #{plane.name} has taken off from #{name}"
    elsif (plane_present(plane) == false) && (plane.status == "grounded")
      "Negative: #{plane.name} isn't present at #{name}"
    else
      "Negative: #{plane.name} has not taken off yet from #{name}"
    end
  end

  def plane_present(plane)
    @planes.include?(plane)
  end

  def full?
    if @planes.size >= @capacity
      true
    else
      false
    end
  end

end
