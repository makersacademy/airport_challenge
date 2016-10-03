require 'capybara/rspec'

feature 'Functioning Airport' do

  scenario 'I can land & take-off a plane' do
    when_i_create_a_plane_and
    when_i_create_an_airport
    i_can_land_the_plane_and
    it_appears_in_the_airport_and
    then_i_can_take_it_off_again_and
    it_will_no_longer_be_at_that_airport
  end

  def when_i_create_a_plane_and
    @my_boeing = Plane.new
    expect(@my_boeing).to respond_to(:land).with(1).argument
  end

  def when_i_create_an_airport
    srand(9)
    @mega_airport = Airport.new
    expect(@mega_airport).to respond_to(:stormy_weather)
  end

  def i_can_land_the_plane_and
    @my_boeing.land(@mega_airport)
  end

  def it_appears_in_the_airport_and
    expect(@mega_airport.landed_planes).to include @my_boeing
  end

  def then_i_can_take_it_off_again_and
    @my_boeing.take_off(@mega_airport)
  end

  def it_will_no_longer_be_at_that_airport
    expect(@mega_airport.landed_planes).not_to include @my_boeing
  end

end
