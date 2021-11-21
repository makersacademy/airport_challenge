require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:subject) { described_class.new }
  let(:plane) { double(:plane) }

  it { is_expected.to respond_to :land_plane }
  it { is_expected.to respond_to :plane_take_off }

  describe "#plane_take_off" do
    it "should confirm the plane is no longer in the airport" do
      allow(subject).to receive(:plane_take_off).and_return("The plane is no longer in the airport")
      expect(subject.plane_take_off).to eq("The plane is no longer in the airport")
    end

    it "should not take off if weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(true)
      expect { subject.plane_take_off(plane) }.to raise_error "Stormy weather: not possible to take off"
    end

    it "should take off if weather is not stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      expect(subject.plane_take_off(plane)).to eq "The plane is no longer in the airport"
    end

  end

  describe "#land_plane" do
    it "should land a plane successfully" do
      allow(subject).to receive(:land_plane).and_return(plane)
      expect(subject.land_plane).to eq plane
    end

    it "shouldn't land if airport has full capacity " do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      allow(subject).to receive(:full_capacity?).and_return(true)
      expect { subject.land_plane(plane) }.to raise_error "Landing not possible, airport is full"
    end

    it "shouldn't allow to land a plane if the weather is stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(true)
      expect { subject.land_plane(plane) }.to raise_error "Stormy weather: not possible to land"
    end

    it "should allow to land a plane if weather is not stormy" do
      allow(subject).to receive(:weather_stormy?).and_return(false)
      expect(subject.land_plane(plane)).to include plane
    end
  end

  context "#initialize" do
    context "with default parameter" do
      let(:airport) { Airport.new }
      it "should use default value" do
        expect(airport.capacity).to eq(5)
      end
    end
    context "input capacity" do
      let(:subjectNoDefaultCapacity) { Airport.new(50) }
      it "should use the input" do
        expect(subjectNoDefaultCapacity.capacity).to eq(50)
      end
    end
  end

  context "#weather_stormy" do
    let(:airport) { Airport.new }
    it "returns stormy" do
      allow(airport).to receive(:weather_stormy?).and_return(true)
      expect(airport.weather_stormy?).to be_truthy
    end
    it "returns sunny" do
      allow(airport).to receive(:weather_stormy?).and_return(false)
      expect(airport.weather_stormy?).to be_falsy
    end
  end

end
