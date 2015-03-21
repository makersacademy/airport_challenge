require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  scenario '- The big event test' do
    planes = []
    6.times { planes << Plane.new }
    airport = Airport.new
    allow(airport).to receive(:local_weather) { 'sunny' }
    planes.each do |plane|
      airport.land plane
    end
    check_landed = planes.all? { |plane| plane.status == 'landed'  }
    expect(check_landed).to eq true
    planes.each do |plane|
      airport.take_off plane
    end
    check_flying = planes.all? { |plane| plane.status == 'flying' }
    expect(check_flying).to be true
  end
end
