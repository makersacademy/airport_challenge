require 'airport'

describe Airport do
  let(:mockPlane) { double :plane, :plane => "plane" }
  let(:mockWeather) { double :weather, :conditions => :sunny }

  describe "Initialize - Airport instance attributes" do
    it "@hangar - will store planes in an array - initialized empty" do
      expect(subject.hangar).to eq([])
    end
    it "@capacity - will record the capacity of the airport with a default" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
#    it "@weather - will record the weather of the airport defaults with new weather instance" do
#      jfk = Airport.new(mockWeather)
#      expect(jfk.weather).to eq(mockWeather)
#    end
  end

  describe "#land_plane" do
    it ".land_plane - returns a Plane object in an array" do
      allow(subject).to receive(:stormy?) { false }
      expect(subject.land_plane(mockPlane)).to eq [mockPlane]
    end
    it ".land_plane - gives error if the hangar is full" do
      allow(subject).to receive(:stormy?) { false }
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(mockPlane) }
      expect { subject.land_plane(mockPlane) }.to raise_error("Hangar Full!!!")
    end
    it ".land_plane - gives error if the weather is stormy" do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land_plane(mockPlane) }.to raise_error("Cannot land due to bad weather!")
    end
  end

  describe "#take_off" do
    it ".take_off - method returns a plane object" do
      allow(subject).to receive(:stormy?) { false }
      subject.land_plane(mockPlane)
      expect(subject.take_off(mockPlane)).to eq(mockPlane)
    end
    it ".take_off - method returns error if there are no planes to take off" do
      expect { subject.take_off(mockPlane) }.to raise_error("No planes on the ground!")
    end
    it ".take_off - gives an error if weather is stormy" do
      allow(subject).to receive(:stormy?) { false }
      subject.land_plane(mockPlane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(mockPlane) }.to raise_error("Cannot take off due to bad weather!")
    end
  end

  describe "#Private method" do
    it ".stormy? - returns true or false" do
      expect(subject.send :stormy?).to be(true).or be(false)
    end
  end
end
