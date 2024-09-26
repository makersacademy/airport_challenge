require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:subject) { described_class.new }
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  context "#initialize" do
    context "with default parameter" do
      it "should use default value" do
        expect(subject.capacity).to eq(5)
      end
    end
     
    context "input capacity" do
      let(:subjectNoDefaultCapacity) { Airport.new(50) }
      it "should use the passed argument" do
        expect(subjectNoDefaultCapacity.capacity).to eq(50)
      end
    end
  end

  describe "#take_off" do

    it "should confirm the plane is no longer at the airport" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:include?).and_return(false)
      expect(subject).not_to include(plane)
    end

    it "should not take off if weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error "Stormy weather: not possible to take off"
    end

    it "should take off only from the airport they are at" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:include?).and_return(true)
      expect(subject).to include plane
    end

    it "should raise an error when plane is not at the airport" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:include?).and_return(false)
      expect { subject.take_off(plane) }.to raise_error "Plane is not at the airport"
    end

    context "#delete" do
      it "should delete a plane from array planes" do
        allow(subject).to receive(:weather_stormy?).and_return(false)
        allow(subject).to receive(:include?).and_return(true)
        expect(subject.planes.find { |p| p == plane }).to eq nil
      end
    end
  end

  describe "#land" do
    it "should land a plane successfully" do
      allow(subject).to receive(:land).and_return(plane)
      expect(subject.land).to eq plane
    end

    it "shouldn't land if airport has full capacity " do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:full_capacity?).and_return(true)
      expect { subject.land(plane).full_capacity? }.to raise_error "Landing not possible, airport is full"
    end

    it "shouldn't allow to land a plane if the weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Stormy weather: not possible to land"
    end

    it "should allow to land a plane if weather is not stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:full_capacity?).and_return(false)
      expect(subject.land(plane)).to include plane
    end

    it "should raise error if plane already landed" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:full_capacity?).and_return(false)
      allow(subject.land(plane)).to receive(:include?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Plane is already at the airport"
    end

  end

  context "#weather_stormy?" do
    it "returns stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(:stormy)
      expect(subject.weather_stormy?).to eq(:stormy)
    end
    it "returns sunny" do
      allow(subject).to receive(:weather_stormy?).and_return(:sunny)
      expect(subject.weather_stormy?).to eq(:sunny)
    end
  end

end
