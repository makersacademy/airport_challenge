require 'plane'

describe Plane do

subject(:plane) {described_class.new}
let(:airport) {double :airport, planes: []}

describe '#take_off' do
  it 'can take off' do
    allow(airport).to receive(:weather).and_return 'sunny'
    plane.take_off(airport)
    expect(plane.status).to eq 'taken off'
  end
  it 'will not longer be in the airport' do
    allow(airport).to receive(:weather).and_return 'sunny'
    plane.take_off(airport)
    expect(airport.planes).not_to include plane
  end
  it 'wont take off if weather is stormy' do
    allow(airport).to receive(:weather).and_return 'stormy'
    expect{plane.take_off(airport)}.to raise_error 'stormy weather cannot take off'
  end
  it 'wont take off if already taken off' do
    allow(airport).to receive(:weather).and_return 'sunny'
    plane.take_off(airport)
    expect{plane.take_off(airport)}.to raise_error 'plane already taken off'
  end
end

describe '#land' do
  it 'can land' do
    allow(airport).to receive(:weather).and_return 'sunny'
    allow(airport).to receive(:full?)
    plane.land(airport)
    expect(plane.status).to eq 'landed'
  end
  it 'will be in the airport' do
    allow(airport).to receive(:weather).and_return 'sunny'
    allow(airport).to receive(:full?)
    plane.land(airport)
    expect(airport.planes).to include plane
  end
  it 'wont land if weather is stormy' do
    allow(airport).to receive(:weather).and_return 'stormy'
    expect{subject.land(airport)}.to raise_error 'stormy weather cannot land'
  end
  it 'wont take off if already taken off' do
    allow(airport).to receive(:weather).and_return 'sunny'
    allow(airport).to receive(:full?)
    plane.land(airport)
    expect{plane.land(airport)}.to raise_error 'plane already landed'
  end
  it 'wont land if the airport is full' do
    allow(airport).to receive(:weather).and_return 'sunny'
    allow(airport).to receive(:full?).and_return true
    expect{plane.land(airport)}.to raise_error 'airport is full cannot land'
  end
end

end
