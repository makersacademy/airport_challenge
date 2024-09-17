require '.lib/airport.rb'
require './lib/plane.rb'
# create airport
@airport = Airport.new
# what does airport need to do?
RSpec.describe Airport do
  expect(subject).respond_to(:land)
  expect(subject).respond_to(:take_off)
end
