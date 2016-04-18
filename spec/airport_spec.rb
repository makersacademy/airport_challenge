require 'airport'

describe Airport do

  let(:plane){double :plane, landed?: true}
  let(:weather){double :weather, stormy?: false}
  subject(:airport){ described_class.new(weather) }

  it "will take different values for capacity" do
    random_cap = rand(40)
    airport = Airport.new weather, random_cap
    expect(airport.capacity).to eq random_cap
  end

  describe '#land_plane' do

    it "lands a plane" do
      airport.land_plane(plane)
      expect(airport.planes).to include plane
    end

    context "doesn't land a plane when" do

      it "stormy" do
        allow(weather).to receive(:stormy?).and_return(true)
        expect{airport.land_plane(plane)}.to raise_error'Too stormy for landing'
      end

      it "full?" do
        airport = Airport.new weather, 1
        plane1 = Plane.new
        airport.capacity.times { airport.land_plane plane }
        expect{airport.land_plane plane}.to raise_error "Airport full"
      end

      it "plane is already landed" do
        airport.land_plane(plane)
        expect{airport.land_plane(plane)}.to raise_error "Already landed"
      end
    end
  end

  describe '#take_off' do
    before do
      airport.land_plane plane
    end

    it "lets a plane take off" do
      allow(plane).to receive(:flying).and_return(false)
      expect(airport.take_off(plane)).to eq plane
    end

    context "doesn't let a plane take off when" do
      it "stormy?" do
        allow(weather).to receive(:stormy?).and_return(true)
        allow(plane).to receive(:flying).and_return(false)
        expect{airport.take_off(plane)}.to raise_error'Too stormy for take-off'
      end

      it "plane isn't in airport" do
        b = Plane.new
        expect{airport.take_off(b)}.to raise_error('Plane cannot take off')
      end
    end
  end

end
