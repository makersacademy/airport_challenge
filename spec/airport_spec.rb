require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  before do
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
  end

  describe "#land" do
    it "lands a plane" do
      expect(subject.land(plane).to eq [plane]
    end

    it "raises an error when airport is full" do
      Airport::MAX_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error "Airport is full boss"
    end

    context "weather condition" do
      it "allows planes to land in blue skies" do
        expect { subject.land(plane) }.to_not raise_error
      end

      it "does not allow a plane to land if stormy" do
        allow_any_instance_of(Weather).to receive(:stormy?) { true }
        expect { subject.land(plane) }.to raise_error "A storms coming Mr Wayne"
      end
    end
  end

  describe "Initialize" do
    it "max capacity" do
      described_class::MAX_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(plane) }.to raise_error "Airport is chock full boss"
    end