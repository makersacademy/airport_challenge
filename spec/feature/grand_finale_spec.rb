require 'capybara/rspec'
require 'airport'
require 'plane'

AIRPORT_CAPACITY = 60

feature 'The airport allows planes to take off and land when weather is fine' do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  before(:example) { allow(airport).to receive(:stormy?).and_return false }

  scenario 'A "new" plane can land at the airport in fine weather' do
    airport.land_plane plane
    expect(plane.status).to eq 'landed'
  end

  scenario 'A plane at the airport can take off in fine weather' do
    airport.land_plane plane
    airport.launch_plane plane
    expect(plane.status).to eq 'flying'
  end

  scenario 'No planes may land if the airport is full' do
    AIRPORT_CAPACITY.times { airport.land_plane Plane.new }
    expect { airport.land_plane plane }.to raise_error 'Airport full'
  end

end

feature 'Planes may not take off or land when the weather is stormy' do

  let(:airport) { Airport.new }

  before(:example) { allow(airport).to receive(:stormy?).and_return true }

  scenario 'No planes may land if the weather is stormy' do
    expect_error = 'Plane cannot land in storm'
    expect { airport.land_plane Plane.new }.to raise_error expect_error
  end

  scenario 'No planes may take off if the weather is stormy' do
    landed_plane = double(:plane, status: 'landed')
    expect_error = 'Plane cannot take off in storm'
    expect { airport.launch_plane landed_plane }.to raise_error expect_error
  end

end

feature 'Grand Finale' do

  # Given 6 planes, each plane must land.
  # Be careful of the weather, it could be stormy!
  # Check when all the planes have landed that they have status "landed"
  # Once all planes are in the air again, check that they have status "flying!"

  let(:airport) { Airport.new }
  test_planes = []
  6.times { test_planes << Plane.new }

  before(:example) { allow(airport).to receive(:stormy?).and_return false }

  scenario 'All six planes can land' do
    test_planes.each { |p| airport.land_plane p }
    expect(test_planes.select { |p| p.status == 'landed' }).to eq test_planes
  end

  scenario 'Now they have landed, all six planes can take off' do
    test_planes.each { |p| airport.launch_plane p }
    expect(test_planes.select { |p| p.status == 'flying' }).to eq test_planes
  end

end
