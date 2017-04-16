require './lib/init.rb'

feature 'Air_traffic_control', :type => :feature do
  scenario 'airport at maximum capacity' do
    given_there_is_an_airport
    and_there_is_a_plane
    and_the_airport_is_at_maximum_capacity
    then_planes_should_be_unable_to_land
  end

  def given_there_is_an_airport
    airport = Airport.new
  end

  def and_there_is_a_plane
    plane = Plane.new
  end

  def and_the_airport_is_at_maximum_capacity
    Airport::DEFAULT_CAPACITY.times { airport.build_plane }
    expect(airport.capacity).to eq airport.planes.count
  end

  def then_planes_should_be_unable_to_land
    expect(airport.dock_plane(plane)).to raise_error "Error: Landing not possible when airport is full."
  end

end
