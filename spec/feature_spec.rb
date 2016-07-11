require './lib/airport'
require './lib/plane'
require './lib/weather'

describe 'Airport challenge' do

  it 'passes feature tests' do
    spitfire = Plane.new
    concord = Plane.new
    boeing = Plane.new
    superman = Plane.new
    gatwick = Airport.new(20)
    heathrow = Airport.new(50)
    allow(Weather).to receive(:stormy?).and_return(false)
    heathrow.land(concord)
    heathrow.take_off(concord)
    concord.taken_off
    concord.landed?
    gatwick.land(superman)
    gatwick.take_off(superman)
    superman.taken_off
    gatwick.land(superman)
    superman.landed
    superman.landed?
    gatwick.capacity
  end

end
