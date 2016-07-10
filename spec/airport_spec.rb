require 'airport'

describe Airport do
subject { described_class.new(20) }
  let(:plane) { double(:plane) }

  describe'#land' do

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'does not allow landing when it is full' do
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Cannot land plane as airport is full"
    end
  end

  describe '#plane' do

      it 'confirms what planes are in an airport' do
        expect(subject.plane).to eq(@planes)
      end
    end

  describe '#take_off' do

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

  end
end
