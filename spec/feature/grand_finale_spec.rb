require 'capybara/rspec'
require 'plane'
require 'airport'

feature 'Planes can take off and land from airport' do
  scenario 'A plane can land at the airport' do
    aeroplane = Plane.new
    airport = Airport.new
    airport.allow_landing(aeroplane)
  end

  scenario 'Plane can take off from the airport' do
    aeroplane = Plane.new
    airport = Airport.new
    airport.allow_takeoff(aeroplane)
  end
end

feature 'Planes cannot land when airport is full' do
  scenario 'A plane tries to land when airport is full' do
    aeroplane = Plane.new
    airport = Airport.new
    6.times { airport.allow_landing Plane.new }
    expect { airport.allow_landing Plane.new }.to raise_error 'Airport is full!'
  end
end

# feature 'Planes cannot land when conditions are stormy' do
#   scenario 'A plane tries to land when it\'s stormy' do
#     aeroplane = Plane.new
#     airport = Airport.new
#     # (somehow knows it's stormy or not)
#     expect { airport.allow_landing Plane.new }.to raise_error 'It\'s too stormy to fly!'
#     end

#   scenario 'A plane tries to take off when it\'s stormy' do |variable|
#     aeroplane = Plane.new
#     airport = Airport.new
#     # (somehow knows it's stormy or not)
#     expect { airport.allow_landing Plane.new }.to raise_error 'It\'s too stormy to land!'
    # end

  # end
# end