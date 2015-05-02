require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Air traffic incoming' do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  scenario 'plane can land' do
    airport.receive plane
    planes = airport.planes
    expect(planes.include? plane).to be true
  end

  scenario 'prevent planes landing when airport is full' do
    airport.capacity.times { airport.receive Plane.new }
    expect { airport.receive Plane.new }.to raise_error 'airport cannot receive planes when at capacity'
  end

end