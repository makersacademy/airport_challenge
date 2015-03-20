class Airport
  attr_writer :plane
  alias_method :land_plane, :plane=

  def takeoff_plane
    fail 'No plane to takeoff' unless @plane
    @plane
  end
end
