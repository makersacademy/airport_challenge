require 'plane'

class Sky
  attr_reader :planes_in_transit

  def initialize
    @planes_in_transit = []
  end
end
