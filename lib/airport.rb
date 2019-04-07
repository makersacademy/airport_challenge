require 'plane'
class Airport

  def capacity(capacity = 1)
    @capacity = capacity
  end

  def land_plane(_plane)
  end

  def plane_take_off(_plane)
    false
  end

  def prevent_take_off_if_stormy(_plane)
    true
  end

  def prevent_landing_if_stormy(_plane)
    true
  end

  def prevent_landing_if_airport_is_full(_plane)
    true
  end
end
