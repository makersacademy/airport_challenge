=begin
require 'airport'
require 'plane'
require 'weather'


feature 'Functioning Airport' do

  scenario 'I can land & take-off a plane' do
    when_i_create_a_plane_and_airport
    i_can_land_the_plane_and
    it_appears_in_the_airport_and
    then_i_can_take_it_off_again_and
    it_will_no_longer_be_at_that_airport
  end

  def when_i_create_a_plane_and_airport
    @my_boeing = Plane.create(:my_boeing)
    @mega_airport = Airport.create(:mega_airport)
  end
    #my_boeing.land(mega_airport)



end
=end
