require 'airport'

describe Airport do

  describe '#initialize' do
    it 'returns defaults if no capacity is specified' do
      expect{(Airport.new::capacity).to eq airport::DEFAULT_CAPACITY}
    end
    it 'sets capacity when specified on initializaion' do
      expect{(Airport.new(10)::capacity).to eq 10}
    end
  end


  describe '#land' do

    it 'lands a plane in the airport' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      expect(subject.land plane).to eq "#{plane} has landed"
    end

    it 'fails to land a plane in stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      plane = Plane.new
      expect{subject.land plane}.to raise_error "Stormy weather preventing landing"
    end

    it 'fails to land a plane if airport is full' do
      allow(subject).to receive(:stormy?) {false}
      allow(subject).to receive(:full?) {true}
      plane = Plane.new
      expect{subject.land plane}.to raise_error "Airport is full"
    end

  end

  describe '#take_off' do

    it 'instructs plane to take off' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      subject.land plane
      expect(subject.take_off plane).to eq "#{plane} has taken off"
    end

    it 'fails to allow plane take off if no planes at airport' do
      allow(subject).to receive(:stormy?) {false}
      plane = Plane.new
      expect{subject.take_off plane}.to raise_error 'No planes available'
    end

    it 'fails to allow plane take off in stormy weather' do
      allow(subject).to receive(:stormy?) {true}
      plane = Plane.new
      expect{subject.take_off plane}.to raise_error "Stormy weather preventing take off"
    end

  end

end
