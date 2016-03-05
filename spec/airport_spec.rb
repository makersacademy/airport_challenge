require "airport"

describe Airport do
  let(:weather) { double :weather }
  subject(:airport) { described_class.new(weather: weather) }

  it "has a default capacity when initialized" do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  describe "#capacity" do
    it "can be overridden when initialized" do
      random_capacity = Random.rand(150)
      subject = described_class.new(capacity: random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  let(:plane) { double :plane }
  before { allow(plane).to receive(:land) }
  before { allow(plane).to receive(:take_off) }
  def storm(value)
    allow(weather).to receive(:stormy?).and_return(value)
  end

  describe "#land" do
    it "lands the plane" do
      storm(false)
      subject.land plane
      expect(subject.planes.last).to eq plane
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
    it "plane takes off from the airport" do
      storm(false)
      subject.land plane
      subject.take_off plane
      expect(subject.planes).not_to include plane
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
