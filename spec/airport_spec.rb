
require 'airport'

describe Airport do
  subject(:airport) {described_class.new(5)}

  describe '#land(plane)' do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it "can store the landed plane in the airport" do
      plane = Plane.new
      plane = airport.land(plane)
      expect(airport.land(plane)).to eq plane
    end
    
    it 'raises an error when the airport is at full capacity' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport is full'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off)}
  end

end