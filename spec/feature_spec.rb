require './lib/airport'
require './lib/plane'
require './lib/weather'

#need to write more

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
    concord.landed?
  end

end
