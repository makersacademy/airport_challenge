require_relative './plane.rb'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def landing(plane)
    return unless giving_permition_for_landing(plane) == true

    @hangar << plane
  end

  def take_off(plane)
    return unless giving_permition_for_take_off(plane) == true

    @hangar.delete(plane)
  end

  def giving_permition_for_landing(plane)
    return unless plane.asking_for_permission? == true

    true
  end

  def giving_permition_for_take_off(plane)
    return unless plane.asking_for_permission? == true

    true
  end
end
