require 'capybara/rspec'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale: Good Weather' do
  airport = Airport.new
  planes = []
  6.times { planes << Plane.new }
  before { allow(airport).to receive(:stormy_weather?) { false } }

  scenario '6 planes made?' do
    expect(planes.count).to eq 6
  end

  scenario 'All planes can land in good weather' do
    planes.each { |plane| airport.land_plane(plane) }
    expect(airport.planes.count).to eq 6
  end

  scenario 'All landed planes return \'false\' to flying?' do
    airport.planes.each do |p|
      expect(p.flying?).to be false
    end
  end

  scenario 'All planes can take off in good weather' do
    3.times do
      airport.planes.each { |plane| airport.plane_take_off(plane) }
    end
    expect(airport.planes.count).to eq 0
  end

  scenario 'All planes return \'true\' to flying?' do
    planes.each do |plane|
      fail 'plane not flying' unless plane.flying?
    end
  end
end

feature 'Grand Finale: Bad Weather' do
  airport = Airport.new
  planes = []
  6.times { planes << Plane.new }
  before { allow(airport).to receive(:stormy_weather?) { true } }

  scenario 'Are there 6 planes?' do
    expect(planes.count).to eq 6
  end

  scenario 'The weather is stormy, the planes should not be able to land' do
    expect { airport.land_plane(planes.pop) }.to raise_error 'Stormy Weather'
  end

  scenario 'The planes managed to land, they should not take off in a storm' do
    allow(airport).to receive(:stormy_weather?) { false }
    planes.each { |plane| airport.land_plane(plane) }
    allow(airport).to receive(:stormy_weather?) { true }
    expect do
      airport.plane_take_off(planes.pop)
    end.to raise_error 'Stormy Weather'
  end
end
