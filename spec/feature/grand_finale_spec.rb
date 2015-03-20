require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

# feature 'Grand Finale' do

#   xscenario 'all planes can land and all planes can take off' do
#     planes = []
#     6.times { planes << Plane.new }
#     airport = Airport.new
#     planes.each do |plane|
#       airport.land plane until plane.status = 'landed' # swap for stub
#     end
#     check_landed = planes.select { |plane| plane.status == 'landed'  }
#     expect(check_landed.length).to eq 6
#     planes.each do |plane|
#       plane.take_off until plane.status = 'flying!'
#     end
#     check_flying = planes.all? { |plane| plane.status == 'flying' }
#     expect(check_flying).to be true
#   end
# end
