require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let (:plane) {double :plane}

  describe 'initialize airport' do

    it 'has a default capacity' do
        expect(subject.capacity).to eq(5)
    end
    #this will be superceded as not public
    it 'can store planes' do
      expect(subject.planes).to eq([])
    end
  end



  describe 'landing a plane' do

    before do
      allow(plane).to receive(:land)
    end

    it 'instructs the plane to land' do
      expect(plane).to receive(:land) #something not right here - expect in wrong place
      subject.land(plane)
    end

    it 'has the plane after landing' do
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'fails when the airport is full' do
      subject.capacity.times {subject.land(plane)}
      error = 'Cannot land as the airport is full'
      expect {subject.land(plane)}.to raise_error
    end

    it 'returns itself' do
      expect(subject.land(plane)).to eq(subject)
    end

  end


  describe 'plane take-off' do
    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.land(plane)
    end

    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      subject.take_off(plane)
    end

    it 'no longer has the plane after take-off' do
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'returns the plane' do
      expect(subject.take_off(plane)).to eq(plane)
    end

  end

  #these should all be in the describe of landing. It adds the plane to the array;
  #it doesn't check the plane land method call went ok (that's in plane spec)


end
