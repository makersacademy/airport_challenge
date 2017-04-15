require './lib/airport'
require './lib/plane'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:hangar) }
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'has a @capacity variable which can be customized upon instantiation of class' do
    subject = Airport.new(20)
    expect(subject.capacity).to eq 20
  end
  describe '#land' do
    it 'raises error if land unavailable' do
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error 'Unable to land'
    end
    it 'lands plane safely' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.hangar).to include plane
    end
    describe '#takeoff' do
      it 'raises error if takeoff unavailable' do
        expect { subject.takeoff }.to raise_error 'Unable to takeoff'
      end
    end
  end
end
