require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:takeoff).with(1).argument }

  describe "#Land" do
    context "when weather is sunny" do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it "instructs planes to land" do
        expect(subject.land(plane)).to eq [plane]
      end
      context "when the airport is full" do
        it "prevents planes form landing" do
          subject.instance_variable_get(:@capacity).times {subject.land(plane)}
          expect { subject.land(plane) }.to raise_error "There is no space"
        end
      end
    end
    context "when weather is stormy" do
      it "prevents planes form landing" do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error "Stormy weather!"
      end
    end
  end

  describe "#Take off" do
    context "when weather is sunny" do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it "instructs planes to take off" do
        subject.land(plane)
        expect(subject.takeoff(plane)).to eq plane
      end
      it "raises an error if a plane is in another airport" do
        airport2 = Airport.new
        allow(airport2).to receive(:stormy?).and_return false
        airport2.land(plane)
        expect { subject.takeoff(plane) }.to raise_error "Plane not found!"
      end
    end
    context "when weather is stormy" do
      it "prevents planes form taking off" do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.takeoff(plane) }.to raise_error "Stormy weather!"
      end
    end
  end

  describe "#Capacity" do
    it "can be overridden" do
      airport1 = Airport.new(66)
      expect(airport1.instance_variable_get(:@capacity)).to eq 66
    end
  end

end
