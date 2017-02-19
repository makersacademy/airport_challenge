require 'plane'

describe Plane do

  it { is_expected.to respond_to :flying }
  it { is_expected.to respond_to :landed }

  it 'can be flying' do
    airport = Airport.new
    airport.land(subject)
    airport.take_off(subject)
    expect(subject.in_flight).to eq(true)
  end

  it 'can be landed' do
    airport = Airport.new
    airport.land(subject)
    expect(subject.in_airport).to eq(true)
  end

  it 'checks a landed plane cannot be in flight' do
    subject.landed
    expect(subject.in_flight).to eq(false)
  end

  it 'checks a flying plane cannot be in airport' do
    subject.flying
    expect(subject.in_airport).to eq(false)
  end

  it 'checks a landed plane is stored at the airport' do
    airport = Airport.new
    airport.land(subject)
    expect(airport.planes).to eq([subject])
  end

end
