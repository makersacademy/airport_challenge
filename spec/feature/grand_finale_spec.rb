require 'capybara/rspec'

feature 'Grand Finale' do

  scenario 'all planes can land and all planes can take off' do

    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(false)

    6.times do
      plane = Plane.new
      airport.arrival(plane)
      expect(plane).not_to be_airborne
    end

    expect(airport.stationed_planes.length).to eq(6)

    6.times do
      next_plane = airport.stationed_planes.last
      airport.departure
      expect(next_plane).to be_airborne
    end

    expect(airport.stationed_planes.length).to eq(0)

  end
end
