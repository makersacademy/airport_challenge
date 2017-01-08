require 'airport'

describe Airport do
  subject(:airport) {described_class.new(15)}
  let(:plane) {double :plane}

  describe 'Airport' do
    it { should respond_to(:take_off) }
    it { should respond_to(:planes) }
  end

  describe '#take_off' do
    it 'does not have a plane after taking off' do
      allow(plane).to receive(:take_off)
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end
    it 'confirms plane departed' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(plane.flying).to eq(true)
    end
  end

  describe '#land' do
    it {should respond_to(:land).with(1).argument}
    it 'has the plane after landing' do
      allow(plane).to receive(:land)
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end
    it 'confirms plane landed' do
      plane = Plane.new
      subject.land(plane)
      expect(plane.flying).to eq(false)
    end
  end

  describe '#initialize' do
    it "sets the airport's capacity" do
      expect(subject.capacity).to eq(15)
    end
    it 'sets a default capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq(20)
    end
  end
end
