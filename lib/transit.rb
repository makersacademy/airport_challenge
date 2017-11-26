require_relative 'airport'
class Transit

  attr_accessor :planes_in_transit

  def initialize
    @planes_in_transit = []
  end

  def stormy?
    rand(10) >= 9 ? true : false
  end

end
