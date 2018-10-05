require "./lib/plane.rb"
require "./lib/airport.rb"

#RSpec.feature "Airport management"
describe Airport do
  it "is a supersystem of many airports that can handle many planes" do
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    plane5 = Plane.new
    airport1 = Airport.new("London",10)
    airport2 = Airport.new("Paris",5)
    airport3 = Airport.new("Rome")

  end
end

=begin
RSpec.feature "Widget management", :type => :feature do
  scenario "User creates a new widget" do
    visit "/widgets/new"

    fill_in "Name", :with => "My Widget"
    click_button "Create Widget"

    expect(page).to have_text("Widget was successfully created.")
  end
end
=end
