
first user story
: who should check that the plane has landed
: in real life the airport should check if the plane has landed

second user story
: passengers - am I supposed to be loading passengers onto and off of the plane?
: airport dock test - check if airport has the plane - no attr_reader. write it for the tests?

third user story
: wanted to do it this way... but couldn't figure out the rspec tests
: also asked the question 'airport, please create the weather' which sounded stupid
  # def check_weather
  #   raise 'No planes can take off in a storm' if Weather.new.stormy?
  # end
: naming practices -- def check(weather) or def check_weather(weather) better?
: unsure of how to approach private methods

further notes
:bug - I can check if a plane is stored in the airport with the method #check_for_landed,
but trying to take_off_from a airport multiple times throws the error 'No planes can land or take off in a storm'


-- context for weather
