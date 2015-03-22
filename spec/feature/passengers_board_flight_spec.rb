require "capybara/rspec"

feature "a passenger can board a plane" do
  scenario "boarding a specific plane" do
    plane = Plane.new
    passenger = Passenger.new
    plane.board(passenger)
    expect(plane.seats).to include(passenger)
  end

  scenario "is checked in once boarded the plane" do
    plane = Plane.new
    passenger = Passenger.new
    plane.board(passenger)
    expect(passenger).to be_checked_in
  end
end
