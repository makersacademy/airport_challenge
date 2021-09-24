# frozen_literal_string: true

require 'plane'

class Airport
  attr_reader :hanger

  def land(plane)
    @hanger = plane
  end
end
