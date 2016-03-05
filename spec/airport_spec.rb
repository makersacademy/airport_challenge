require "airport"

describe Airport do
  let(:weather) { double :weather }
  subject(:airport) { described_class.new(weather: weather) }

  it "has a default capacity" do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  describe "#capacity" do
    it "can be overridden when initialized" do
      random_capacity = rand(150)
      subject = described_class.new(capacity: random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe "take-off and landing" do
    let(:plane) { double :plane }
    before :each do
      allow(plane).to receive(:land_at)
      allow(plane).to receive(:depart_from)
    end
    def storm(value)
      allow(weather).to receive(:stormy?).and_return(value)
    end

    describe "#land" do
      it "instructs the plane to land" do
        storm(false)
        expect(plane).to receive(:land_at)
        subject.land plane
      end

      it "lands the plane" do
        storm(false)
        subject.land plane
        expect(subject.send(:planes).last).to eq plane
      end

      it "prevents landing when weather is stormy" do
        storm(true)
        message = "Landing prevented due to stormy weather"
        expect { subject.land plane }.to raise_error message
      end

      it "allows landing when weather is clear" do
        storm(false)
        expect { subject.land plane }.not_to raise_error
      end

      it "prevents landing when airport is full" do
        storm(false)
        described_class::DEFAULT_CAPACITY.times { subject.land plane }
        message = "Airport reached its capacity"
        expect { subject.land plane }.to raise_error message
      end
    end

    describe "#take_off" do
      it "instructs the plane to take off" do
        storm(false)
        expect(plane).to receive(:depart_from)
        subject.take_off(plane)
      end

      it "plane leaves the airport" do
        storm(false)
        subject.land plane
        subject.take_off plane
        expect(subject.send(:planes)).not_to include plane
      end

      it "prevents take-off when weather is stormy" do
        storm(true)
        message = "Take-off prevented due to stormy weather"
        expect { subject.take_off plane }.to raise_error message
      end

      it "allows take-off when weather is clear" do
        storm(false)
        expect { subject.take_off plane }.not_to raise_error
      end
    end
  end
end
