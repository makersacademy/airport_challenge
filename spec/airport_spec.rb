require 'airport'

describe Airport do
  subject(:airport) {described_class.new(15)}
  plane = Plane.new

  describe 'Airport' do
    it { should respond_to(:take_off) }
    it { should respond_to(:planes) }
  end

  describe '#take_off' do
    context 'not stormy' do
      it 'does not have a plane after taking off' do
        allow(airport).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:take_off)
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end
      it 'confirms plane departed' do
        allow(airport).to receive(:stormy?).and_return(false)
        subject.land(plane)
        subject.take_off(plane)
        expect(plane.flying).to eq(true)
      end
      it "doesn't let a plane take off from wrong airport" do
        allow(airport).to receive(:stormy?).and_return(false)
        airport1 = Airport.new
        allow(airport1).to receive(:stormy?).and_return(false)
        subject.land(plane)
        error = "Plane cannot be found in this airport"
        expect{airport1.take_off(plane)}.to raise_error(error)
      end
    end
    context 'stormy' do
      it 'does not let a plane take off if stormy' do
        allow(airport).to receive(:stormy?).and_return(true)
        error = "Plane cannot take off during storm"
        expect{subject.take_off(plane)}.to raise_error(error)
      end
    end
  end

  describe '#land' do
    context 'not stormy' do
      it 'has the plane after landing' do
        allow(airport).to receive(:stormy?).and_return(false)
        allow(plane).to receive(:land)
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end
      it 'confirms plane landed' do
        allow(airport).to receive(:stormy?).and_return(false)
        subject.land(plane)
        expect(plane.flying).to eq(false)
      end
      it 'prevents plane landing when airport full' do
        allow(airport).to receive(:stormy?).and_return(false)
        subject.capacity.times {subject.land(Plane.new)}
        error = "Airport full"
        expect {subject.land(plane)}.to raise_error(error)
      end
      it 'prevents same plane landing twice consecutively' do
        allow(airport).to receive(:stormy?).and_return(false)
        subject.land(plane)
        error = "Plane already landed"
        expect {subject.land(plane)}.to raise_error(error)
      end
    end
    context 'stormy' do
      it 'prevents the plane landing when its stormy' do
        allow(airport).to receive(:stormy?).and_return(true)
        error = "Cannot land plane when stormy"
        expect {subject.land(plane)}.to raise_error(error)
      end
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
