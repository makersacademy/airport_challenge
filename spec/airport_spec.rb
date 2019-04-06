require 'airport'

describe Airport do

  describe '#land' do

    it 'should not allow landing in stormy weather' do
      plane = Plane.new
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.land(plane) }.to raise_error "The plane is unable to land"
    end

    it 'should not allow planes to land if the airport is full' do
      allow(subject).to receive(:rand).and_return(1)
      15.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "The plane is unable to land"
    end
  end

  describe '#take_off' do
    it 'should allow a user to instruct a plane to take off' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.take_off).to eq 'The plane has taken off'
    end

    it 'should not allow take off in stormy weather' do
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.take_off }.to raise_error "Planes can't take off in stormy weather"
    end
  end
end
