require 'capybara/rspec'

feature "a pilot can land their plane" do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  before { allow(airport).to receive(:stormy?).and_return(false) }
  scenario "arriving at an airport" do
    airport.arrival(plane.land)
    expect(plane).not_to be_airborne
  end
  scenario "except when the airport is full" do
    Airport::DEFAULT_CAPACITY.times { airport.arrival(plane.land) }
    expect { airport.arrival(plane.land) }.to raise_error 'Airport Full'
  end
end
