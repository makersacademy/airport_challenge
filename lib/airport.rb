class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end
  def empty?
    if @hangar.length != 0
      false
    else
      true
    end
  end

  def take_in_plane(plane)
    @hangar.push(plane)
  end
end
