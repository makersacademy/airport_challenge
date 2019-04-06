require 'airport'

describe Airport do

  describe '#land' do
    it 'should allow a user to land a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'should allow a user to instruct a plane to take off' do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.take_off).to eq 'The plane has taken off'
    end

    it 'should not allow takeoff in stormy weather' do
      allow(subject).to receive(:rand).and_return(0)
      expect{ subject.take_off }.to raise_error "Planes can't take off in stormy weather"
    end
  end

end
