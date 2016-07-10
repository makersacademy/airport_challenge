require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let (:plane) {double :plane}


  it {is_expected.to respond_to :full?}
  it 'has a default capacity' do
      expect(subject.capacity).to eq(5)
  end

  #this will be superceded as not public
  it 'can store planes' do
    expect(subject.planes).to eq([])
  end



  describe 'landing a plane' do

    before do
      allow(plane).to receive(:land)
    end

    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
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


  #these should all be in the describe of landing. It adds the plane to the array;
  #it doesn't check the plane land method call went ok (that's in plane spec)


end
