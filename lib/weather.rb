require 'plane'
require 'airport'

class Weather

  def stormy?
    if rand(8) == 1 then return true
    else return false
    end
  end

end
