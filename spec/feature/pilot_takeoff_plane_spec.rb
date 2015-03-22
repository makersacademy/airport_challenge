require 'capybara/rspec'

feature "a pilot can take off a plane" do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }
  before { allow(airport).to receive(:stormy?).and_return(false) }
  scenario "departing from an airport" do
    airport.arrival(plane.land)
    airport.departure(plane.take_off)
    expect(plane).to be_airborne
  end
end
