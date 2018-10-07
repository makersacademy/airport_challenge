require "airport"

describe Airport do
  subject(:airport) { described_class.new(10) }

  describe "#land" do
     it 'lands at an airport' do
       allow(subject).to receive(:stormy?).and_return false
       expect(subject).to respond_to(:land).with(1).argument
     end
  end
  describe '#takeoff' do
    context 'when not stormy' do
      it 'instructs a plane to take off from an airport' do
        airport = Airport.new(10)
        plane = Plane.new

        expect(subject).to respond_to(:takeoff).with(1).argument
      end
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it 'prevents take off when weather is stormy' do
        airport = Airport.new(10)
        plane = Plane.new
        expect { subject.takeoff(plane) }.to raise_error  'No takeoff permitted due to bad weather condition'
      end
    end
  end

context 'when stormy' do
it 'prevents landing when weather is stormy' do
  airport = Airport.new(10)
  plane = Plane.new
  allow(subject).to receive(:stormy?).and_return true
  expect { subject.land(plane) }.to raise_error "No landing permitted due to bad weather"
end
end


context 'when full' do
  it 'prevents landing when the airport is full' do
    allow(subject).to receive(:stormy?).and_return false
    plane = double :plane
    10.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport is full'
  end
end
end
