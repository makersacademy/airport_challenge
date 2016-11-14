require "./lib/airport.rb"

class Airplane
  attr_reader :flying

  def landed
    @flying = false
  end

  def taken_off
    @flying = true
  end

private

def initialize
  @flying = true
end

end
