 require_relative 'plane'

class Airport
attr_reader :planes

  def initialize
      @planes = []
  end

  def land(plane)
    @planes << plane
    #confirm_landing
  end

private

  def confirm_landing
      "The plane has landed"
  end
end
