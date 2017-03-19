=begin
USER STORY 6
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can
be overridden as appropriate
=end

require './lib/plane'
require './lib/airport'
require './lib/weather'

weather = Stormy_Weather.new.report

plane = Plane.new
airport = Airport.new(50)

# I would like a default airport capacity that can
# be overridden as appropriate
