require_relative '../lib/airport'
require_relative '../lib/plane'

describe Plane do
  it 'marks a plane as landed' do
    expect(subject.landed).to eq true
  end

  it 'stops a plane from landing if already landed' do
    airport = Airport.new
    plane = Plane.new
    allow(plane).to receive(:already_landed?).and_return(true)
    expect { airport.land(plane) }.to raise_error 'Already landed'
  end
end
