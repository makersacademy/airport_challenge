require './lib/airport'

describe Airport do
  let(:plane) { double :plane, landed_at: nil }

  context '#weather is #sunny' do
    let(:weather) { double :weather, condition: "Sunny" }

    it "has a default #name the Airport" do
      expect(subject.name).to eq("the Airport")
    end

    it "can be named" do
      airport = Airport.new("test")
      expect(airport.name).to eq("test")
    end

    it "has a #runway" do
      expect(subject.runway.class).to eq(Array)
    end

    it "can be #full" do
      expect(subject).to respond_to(:full?)
    end

    it "recognised #runway with 10 as #full" do
      subject.runway = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]
      expect(subject).to be_full
    end

    it "landing #plane goes into #runway" do
      #
      subject.land_plane(plane)
      expect(subject.runway).to eq([plane])
    end

    it "#plane leaves #runway after #takeoff" do
      allow(plane).to receive(:landed_at).and_return(subject)
      subject.runway = [plane]
      subject.takeoff_plane(plane)
      expect(subject.runway).to eq([])
    end

    it "#plane cannot #land if already in #landed_at an #airport" do
      allow(plane).to receive(:landed_at).and_return(subject)
      expect { subject.landing_check(plane) }.to raise_error "Already landed at the Airport"
    end

    it "plane cannot #land_at a #full #airport" do
      subject.runway = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]
      expect { subject.landing_check(plane) }.to raise_error "Cannot land, airport full"
    end

  end

  context 'when #airport is #stormy' do

    let(:current_weather) { double :weather, condition: "Stormy" }

    it "cannot #land if #weather is #stormy #airport" do
      expect { subject.landing_check(plane) }.to raise_error "Cannot land, weather at the Airport stormy"
    end

    it "cannot #takeoff if #weather is #stormy" do
      allow(plane).to receive(:landed_at).and_return(subject)
      expect { subject.takeoff_check(plane) }.to raise_error "Cannot takeoff, weather at Test stormy"
    end

  end
end
