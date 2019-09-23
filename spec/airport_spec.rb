require 'airport'
describe Airport do
  let(:airport) {Airport.new}
  let(:plane) {double :plane}
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

before {allow(airport).to receive(:stormy?).and_return(false)}

it 'should be able to land planes' do
  expect(airport.land(plane)).to eq [plane]
end

it 'should be able to let planes take off' do
  airport.land(plane)
  expect(airport.take_off(plane)).to eq plane
end

it 'should be able to remove planes from the runway after takeoff' do
  airport.land(plane)
  airport.take_off(plane)
  expect(airport.empty?).to eq true
end

it 'should prevent planes from landing when stormy' do
  allow(airport).to receive(:stormy?) { true }
  expect{airport.land(plane)}.to raise_error 'Cannot land in stormy weather'
end

it 'should prevent planes from taking off when stormy' do
  airport.land(plane)
allow(airport).to receive(:stormy?) { true }
  expect{airport.take_off(plane)}.to raise_error 'Cannot take off in stormy weather'
end

it 'should prevent landing when the airport is full' do
  airport.capacity.times {airport.land(plane)}
  expect { airport.land(plane) }.to raise_error 'Cannot land when airport is full'
end

it 'should allow users to set a new airport capacity' do
  subject = Airport.new(capacity = 10)
  allow(subject).to receive(:stormy?) { false }
  subject.capacity.times {subject.land(plane)}
  expect { subject.land(plane) }.to raise_error 'Cannot land when airport is full'
end
end
