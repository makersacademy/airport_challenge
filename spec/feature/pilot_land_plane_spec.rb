require "capybara/rspec"

feature "a pilot can land their plane" do

  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  let(:land_a_plane) { airport.arrival(plane) }

  before { allow(airport).to receive(:stormy?).and_return(false) }

  scenario "arriving at an airport" do
    land_a_plane
    expect(plane).not_to be_airborne
  end

  scenario "except when the airport is full" do
    Airport::DEFAULT_CAPACITY.times { airport.arrival(plane) }
    expect { land_a_plane }.to raise_error "Airport Full"
  end

end
