require './lib/airport.rb'
require './lib/plane.rb'
# create airport
@airport = Airport.new
# what does airport need to do?
describe Airport do
  it { expect(Airport.new).to respond to(:land) }
  it { expect(Airport.new).to respond to(:take_off) }
end
