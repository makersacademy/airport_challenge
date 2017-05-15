require 'run_program'

RSpec.feature 'Feature Tests', :type => :feature do
  scenario 'A Plane lands into an airport' do
    given_there_is_a_plane
    given_there_is_an_airport
    the_plane_can_land_into_the_airport
  end
end

def given_there_is_a_plane
  @plane = Plane.new
end

def given_there_is_an_airport
  @airport = Airport.new
end

def the_plane_can_land_into_the_airport
  @plane.land(@airport)
end
