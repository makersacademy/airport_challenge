require_relative 'plane'
class Airport
  attr_reader :stored_planes

  def initialize
    @stored_planes = []
    @stormy = false
  end

  def receive_plane(plane)
    @stored_planes << plane unless stormy?
  end

  def release_plane(plane)
    @stored_planes.delete(plane) unless stormy?
  end

  def report_storm
    @stormy = true
  end

  def stormy?
    @stormy
  end

end
