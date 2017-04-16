require 'airport'

describe 'Feature test' do
  let(:weather) { double :weather }
  let(:airport) { double :airport }
  it 'lands and takes off multiple planes' do
    gatwick = Airport.new(30)
    heathrow = Airport.new
    allow(gatwick).to receive(:stormy?).and_return(false)
    allow(heathrow).to receive(:stormy?).and_return(false)
    boeing = Plane.new
    jet = Plane.new
    concorde = Plane.new
    30.times { gatwick.land(Plane.new) }
    expect { gatwick.land(jet) }.to raise_error 'Airport full'
    heathrow.land(boeing)
    message = 'Plane is not in the airport'
    expect { heathrow.takeoff(jet) }.to raise_error message
    expect(jet).not_to be_landed
    heathrow.land(concorde)
    expect(concorde).to be_landed
    heathrow.takeoff(boeing)
    expect { boeing.takeoff }.to raise_error 'Already flying'
    message = 'Plane already landed elsewhere!'
    expect { gatwick.land(concorde) }.to raise_error message
    message = 'Plane is already in the airport'
    expect { heathrow.land(concorde) }.to raise_error message
    heathrow.land(jet)
    expect(heathrow.in_airport?(jet)).to eq true
  end
end
