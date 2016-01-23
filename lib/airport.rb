require_relative 'plane'

class Airport

 attr_reader :planes

 def initialize
   @planes = []
 end

 def has_landed(plane)
   @planes << plane
 end

end
