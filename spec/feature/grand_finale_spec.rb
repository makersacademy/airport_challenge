require "capybara/rspec"

feature "Grand Finale" do

  airport = Airport.new

  before { allow(airport).to receive(:stormy?).and_return(false) }

  scenario "all planes can land " do
    6.times do
      plane = Plane.new
      airport.arrival(plane)
      expect(plane).not_to be_airborne
    end
    expect(airport.stationed_planes.length).to eq(6)
  end

  scenario "and then all these planes can take off" do
    6.times do
      next_plane = airport.stationed_planes.last
      airport.departure
      expect(next_plane).to be_airborne
    end
    expect(airport.stationed_planes.length).to eq(0)
  end
end
