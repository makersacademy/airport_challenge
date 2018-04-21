require './docs/weather.rb'
require './docs/airport.rb'
require './docs/plane.rb'

describe Airport do
  it { is_expected.to respond_to :weather }

  describe '#initialize' do
    it 'should have a default capacity of 1 plane' do
      expect(subject.capacity).to eq 1
    end
  end

  describe '#capacity' do
    it 'should allow the default capacity to be overriden' do
      subject.capacity = 2
      expect(subject.capacity).to eq 2
    end
  end

  describe '#stationed_planes' do
    it 'should allow the controller to see which planes are stationed in the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.stationed_planes). to eq [plane]
    end
  end

  describe '#land' do
    it 'raises an error when the airport is at full capacity' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end
    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
      expect(subject.stationed_planes). to eq []
    end
  end
end
