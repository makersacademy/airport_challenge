require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'landing planes' do
    given_there_is_an_airport
    and_there_is_a_plane
    when_i_instruct_a_plane_to_take_off_from_an_airport
    then_the_plane_should_take_off_from_the_aiport
    and_the_plane_should_confirm_it_has_left_the_airport
  end

  def given_there_is_an_airport
    @airport = Airport.new
  end

  def and_there_is_a_plane
    @plane = Plane.new
  end

  def when_i_instruct_a_plane_to_take_off_from_an_airport
    @airport.release_plane(@plane)
  end

  def then_the_plane_should_take_off_from_the_aiport
    expect(@plane.landed).to eq false
    expect(@airport.planes).to_not include @plane
  end

  def and_the_plane_should_confirm_it_has_left_the_airport
    expect(@plane.take_off).to eq "This plane is in the air."
  end
end
