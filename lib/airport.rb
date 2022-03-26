require_relative './weather'

class Airport

  include Weather

  attr_reader :hangar

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def store_plane(plane)
    return raise "You cannot land during stormy weather" unless weather == "sunny"

    @hangar.push(plane) if full? == false
  end

  def remove_plane_from_hangar(plane)
    return raise "You cannot take off during stormy weather" unless weather == "sunny"

    @hangar.each_index do |index|
      if @hangar[index] == plane
        @hangar.delete_at(index)
        break
      else
        return raise "The plane is not stored at this airport"
      end
    end
    @hangar
  end

  def full?
    raise "The airport is full, you cannot land here" unless @hangar.length <= @capacity
    false
  end

end
