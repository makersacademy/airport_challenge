

class Airport
  DEFAULT_CAPACTIY = 20
  attr_reader :onground, :inair, :capacity

  def initialize(capacity = DEFAULT_CAPACTIY)
    @ongound = []
    @inair = []
    @capacity = capacity
  end
end
