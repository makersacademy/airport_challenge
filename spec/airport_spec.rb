require 'airport'
describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

it 'should be able to land planes' do
  plane = Plane.new
  airport = double("airport")
  allow(airport).to receive(:weather) { 'sunny' }
  expect(subject.land(plane)).to eq [plane]
end

it 'should be able to let planes take off' do
  plane = Plane.new
  airport = double("airport")
  allow(airport).to receive(:weather) { 'sunny' }
  subject.land(plane)
  expect(subject.take_off(plane)).to eq plane
end

it 'should be able to remove planes from the runway after takeoff' do
  plane = Plane.new
  airport = double("airport")
  allow(airport).to receive(:weather) { 'sunny' }
  subject.land(plane)
  subject.take_off(plane)
  expect(subject.empty?).to eq true
end

it 'should prevent planes from landing when stormy' do
  plane = Plane.new
  subject.report_stormy
  expect{subject.land(plane)}.to raise_error 'Cannot land in stormy weather'
end

it 'should prevent planes from taking off when stormy' do
  plane = Plane.new
  subject.land(plane)
  subject.report_stormy
  expect{subject.take_off(plane)}.to raise_error 'Cannot take off in stormy weather'
end

it 'should prevent landing when the airport is full' do
  plane = Plane.new
  airport = double("airport")
  allow(airport).to receive(:weather) { 'sunny' }
  subject.capacity.times {subject.land(plane)}
  expect { subject.land(plane) }.to raise_error 'Cannot land when airport is full'
end

it 'should allow users to set a new airport capacity' do
  plane = Plane.new
  airport = Airport.new(capacity = 10)
  airport = double("airport")
  allow(airport).to receive(:weather) { 'sunny' }
  subject.capacity.times {subject.land(plane)}
  expect { subject.land(plane) }.to raise_error 'Cannot land when airport is full'
end
end
