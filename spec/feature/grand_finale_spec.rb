require 'capybara/rspec'
require 'airport'

feature 'planes can use airport' do
  airport = Airport.new
  planes = []
  6.times { planes << Plane.new }
  scenario ' 6 planes ' do
    expect(planes.count).to eq 6
  end

  scenario ' 6 planes can land with no bad weather present' do
    planes.each { |plane| airport.land_plane(plane) }
    expect(airport.planes.count).to eq 6
  end

  scenario ' landed planes are no longer flying' do
    airport.planes.each do |p|
      expect(p.flying?).to be false
    end
  end

  scenario ' planes can leave airport' do
    6.times do
      airport.planes.each { |plane| airport.plane_take_off(plane) }
    end
    expect(airport.planes.count).to eq 0
  end

  scenario 'planes have flying status' do
    planes.each do |plane|
      fail 'plane not flying' unless plane.flying?
    end
  end

  scenario ' Airport full? ' do
    expect(planes.count).to eq 6
  end

  scenario ' The weather is bad, no planes to land allowed' do
    expect { airport.land_plane(planes) }.to raise_error ' Bad Weather'
  end

  scenario ' not allowed to leave the airport' do
    expect { airport.fly(planes) }.to raise_error 'Bad Weather'
  end
end
