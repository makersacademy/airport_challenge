require 'airport'
require 'plane'

describe Airport do
# subject | is an instance of the airport class

  describe '#new' do
    it 'returns a new airport object' do
      expect(subject).to be_an_instance_of(Airport)
    end
  end

  describe '#land' do
    it 'responds to the land method' do
      expect(subject).to respond_to(:land)
    end

    it 'takes a plane as an argument and returns it' do
      plane = Plane.new('Boeing234')
      expect(subject.land(plane)).to eq([plane])
    end

    context 'when the airport is full' do
      it 'raise an exception' do
        plane = Plane.new('BRITISH AIRWAYS')
        10.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error
      end
    end

  end

  describe '#take_off' do
    it 'responds to take_off method' do
      expect(subject).to respond_to(:take_off)
    end

    it 'takes off and it confirms that there are 0 planes left in the airport' do
      plane = Plane.new('RYANAIR 77')
      expect(subject.take_off(plane)).to eq nil
    end
  end

end
