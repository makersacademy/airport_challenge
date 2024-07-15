require_relative 'airport'
require_relative 'plane'
class Weather
  # get random number up to 5 and if it is 5 weather stormy? returns true
  def stormy?
    rand(6) == 5
  end
end
