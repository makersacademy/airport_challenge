require "airport"

describe Airport do

  context '#receive_plane' do

    before(:each) do
      @plane = Plane.new
      @plane2 = Plane.new
      subject.receive_plane(@plane)
      subject.receive_plane(@plane2)
    end

    it 'Can recieve a plane at the airport' do
      expect(subject.planes.shift).to eq @plane
    end

    it 'The airport can receive more than one plane' do
      expect(subject.planes).to include(@plane, @plane2)
    end
  end

  describe '#take_off' do

    before(:each) do
      @plane = Plane.new
      subject.receive_plane(@plane)
    end

    it { is_expected.to respond_to(:take_off) }

    it 'Orders planes to take off from the airport' do
      expect(subject.take_off).to be_kind_of(Plane)
    end
  end

  describe '#empty?' do
    it 'Returns true if the airport is empty' do
      expect(subject.is_empty?).to eq true
    end

    it 'Returns false if the airport is not empty' do
      subject.receive_plane(Plane.new)
      expect(subject.is_empty?).to eq false
    end
  end

  describe '#full?' do
    it 'Returns true if the airport is full' do
      Airport::DEFAULT_CAPACITY.times {subject.receive_plane(Plane.new)}
      expect(subject.is_full?).to eq true
    end

    it 'Returns false if the airport is not full and below full capacity' do
      expect(subject.is_full?).to eq false
    end
  end

  describe 'error handling' do
    it 'Raises and error if you try to land a plane when the airport is full' do
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times {airport.receive_plane(Plane.new)}
      expect { airport.receive_plane(Plane.new) }.to raise_error('Airport is full, no landing this time')
    end
  end
end
