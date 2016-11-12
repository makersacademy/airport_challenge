require_relative 'plane'

class Airport

  attr_reader :landing_bay

  def initialize
    @landing_bay = []
  end

  def store_plane(plane)
    @landing_bay << plane
  end






end
