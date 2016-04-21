require 'plane'
require 'airport'

class Weather

  def stormy?
    return true if rand(8) == 1
    false
  end

end
