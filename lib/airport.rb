class Airport
  attr_reader :airport

  def initialize
    @airport = []
    p @airport
  end

  def land
    @airport << 'plane'
    p @airport
  end
end
