require_relative 'airplane'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

end
