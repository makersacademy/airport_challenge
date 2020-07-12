require 'airport'
describe Airport do
  let(:plane) { double("plane", :landed => false) }
  let(:landing) { allow(plane).to receive(:land_plane).with(subject) { |subject| subject.planes << plane } }
  let(:takeoff) { allow(plane).to receive(:take_off_from).with(subject) { |subject| subject.planes.delete(plane) } }
  
  it 'stores landed planes' do
    landing
    plane.land_plane(subject)
    expect(subject.planes).to include(plane)
  end
  it 'does not contain a plane after the plane has taken off' do
    landing
    takeoff
    plane.land_plane(subject)
    plane.take_off_from(subject)
    expect(subject.planes).not_to include(plane)
  end

  describe '#empty' do
    it 'returns true if there are no planes in the airport' do
      expect(subject.empty?).to eq true
    end
    it 'returns false if there is a plane in the airport' do
      landing
      plane.land_plane(subject)
      expect(subject.empty?).to eq false
    end
  end

  describe '#full' do
    it 'returns true if the airport is full' do
      subject.override_capacity(1)
      landing
      plane.land_plane(subject)
      expect(subject.full?).to eq true
    end
    it 'returns false if the airport is not full' do 
      expect(subject.full?).to eq false
    end
  end

  describe '#override_capacity' do
    it 'overrides the default capacity of the airport to a new value' do
      subject.override_capacity(20)
      expect(subject.capacity).to eq 20 
    end
  end
end
