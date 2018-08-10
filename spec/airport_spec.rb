require 'airport'
describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:weatherquality) }
  it { is_expected.to respond_to(:terminal) }
  it { is_expected.to respond_to(:capacity) }
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

  it 'should tell us the weather' do
    subject.weatherquality
    expect(['bad', 'good']).to include(subject.weatherquality)
  end

  describe '#land' do
    context 'when weather is good' do
      it 'should let a plane land' do
        allow(airport).to receive(:weatherquality).and_return('good')
        expect(airport.land(plane)).to include("#{plane}")
      end
      it 'can land the maximum capacity of planes' do
        allow(airport).to receive(:weatherquality).and_return('good')
        airport.capacity.times { airport.land(Plane.new) }
        expect(airport.terminal.length).to eq airport.capacity
      end
      context 'when capacity is full' do
        it 'raises an error if capacity is reached' do
          allow(airport).to receive(:weatherquality).and_return('good')
          airport.capacity.times { airport.land(Plane.new) }
          expect { airport.land(Plane.new) }.to raise_error('Capacity is full')
        end
      end
    end
    context 'when weather is bad' do
      it 'should not let a plane land if weather is bad' do
        allow(airport).to receive(:weatherquality).and_return('bad')
        expect { airport.land(plane) }.to raise_error 'Weather is bad for landing'
      end
    end
  end

  describe '#takeoff' do
    context 'when weather is good' do
      it 'should let a plane take off' do
        allow(airport).to receive(:weatherquality).and_return('good')
        airport.land(plane)
        expect(airport.takeoff(plane)).to include("#{plane}")
      end
    end
    context 'when weather is bad' do
      it 'should not let a plane take off' do
        allow(airport).to receive(:weatherquality).and_return('bad')
        expect { airport.takeoff(plane) }.to raise_error 'Weather is bad for taking off'
      end
    end
  end
end
