require 'airport'

describe Airport do

  describe '#land' do
    it 'lands a plane in the airport' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      expect(subject.land plane).to eq "#{plane} has landed"
    end
    it 'fails to lands a plane in stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      plane = Plane.new
      expect{subject.land plane}.to raise_error "Stormy weather preventing landing"
    end
  end

  describe '#take_off' do
    it 'instructs plane to take off' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      subject.land plane
      expect(subject.take_off plane).to eq "#{plane} has taken off"
    end
    it 'fails to allow plane take off in stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      plane = Plane.new
      expect{subject.take_off plane}.to raise_error "Stormy weather preventing take off"
    end
  end

end
