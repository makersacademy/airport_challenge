require_relative 'plane'

# manages landing and leaving planes. Takes information from Weather class to
# decide whether a plane should land or take off.
class Airport

  def land(plane)
    landed_plane = plane.land
    confirm(landed_plane)
  end
  # TODO try to add an if clause to line 14 - 'if plane.landed?'
  # TODO and figure out why such clause returns a nil.
  def confirm(plane)
    p "The plane #{plane.object_id} has landed."
  end
end
