require 'airport'

describe Airport do
  subject(:airport) {described_class.new(15)}
  let(:plane) {double :plane}

  describe 'Airport' do
    it { should respond_to(:take_off) }
    it { should respond_to(:planes) }
  end

  describe '#take_off' do
    context 'not stormy' do
      it 'does not have a plane after taking off' do
        allow(airport).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:take_off)
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end
      it 'confirms plane departed' do
        allow(airport).to receive(:stormy?).and_return(false)
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(plane.flying).to eq(true)
      end
    end
    context 'stormy' do
      it 'does not let a plane take off if stormy' do
        plane = Plane.new
        allow(airport).to receive(:stormy?).and_return(true)
        error = "Plane cannot take off during storm"
        expect{subject.take_off(plane)}.to raise_error(error)
      end
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
    it 'prevents plane landing when airport full' do
      subject.capacity.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error("Airport full")
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
