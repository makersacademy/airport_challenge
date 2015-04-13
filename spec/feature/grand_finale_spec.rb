require 'capybara/rspec'

feature 'As a pilot' do

  scenario 'I would like to land my plane at an appropriate airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect @landed.should include(plane)
  end
  scenario 'I would like to be able to take off from the appropriate airport' do
    airport = Airport.new
    plane = Plane.new
    airport.take_off(plane)
    expect @landed.should_not include(plane)
  end
end

feature 'As an air traffic controller' do

  scenario 'I want to prevent planes landing when the airport is full' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect('Airport is full, landing denied').to eq('Airport is full, landing denied')
  end
  scenario 'I want to prevent planes landing when the weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect('There is a storm, landing denied').to eq('There is a storm, landing denied')
  end
end
