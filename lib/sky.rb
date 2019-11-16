require 'plane'

class Sky
  attr_accessor :planes_in_transit

  def initialize
    @planes_in_transit = []
  end
end
