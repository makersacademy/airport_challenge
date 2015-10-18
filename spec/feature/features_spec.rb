require 'capybara/rspec'

feature 'a traffic controller can instruct a plane' do
  scenario 'to land' do
    airport = Airport.new
    plane = Plane.new
    expect(plane).to respond_to(:land)
  end
  scenario 'to take off' do
    airport = Airport.new
    plane = Plane.new
    expect(plane).to respond_to(:take_off)
  end
end
