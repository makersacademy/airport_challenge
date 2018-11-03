require_relative 'plane'

class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land_at_airport(plane)
    raise 'That plane has already landed!' if @hangar.include?(plane)
    @hangar << plane
  end

  def take_off_from_airport(plane)
    @hangar.delete(plane) unless not_valid_take_off?(plane)
  end

  def confirm_take_off(plane)
    raise "#{plane} has not taken off!" if @hangar.include?(plane)
    "Confirmed: #{plane} has taken off!"
  end

  private

  def not_valid_take_off?(plane)
    raise 'There are no planes left at this airport!' if @hangar.empty?
    raise 'That plane is not at the airport!' unless @hangar.include?(plane)
  end

end
