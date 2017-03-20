require 'airport'

describe Airport do

  subject(:airport) {described_class.new}
  let(:airplane) {double :airplane, taken_off: nil, landed: nil}

  describe 'initialization' do

    it 'sets airport capacity equal to the default capacity if no argument is passed' do
      allow(airport).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times { airport.land_plane(airplane) }
      expect { airport.land_plane(airplane) }.to raise_error "Plane cannot land. The airport is full"
    end

    it 'overrides the default capacity with the argument passed' do
      random_capacity = rand(1..1000)
      heathrow = described_class.new(random_capacity)
      allow(heathrow).to receive(:stormy?).and_return(false)
      random_capacity.times { heathrow.land_plane(airplane) }
      expect { heathrow.land_plane(airplane) }.to raise_error "Plane cannot land. The airport is full"
    end

  end

  describe '#land_plane' do

    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end


      it "instructs a plane to land" do
        expect(airport.land_plane(airplane)).to eq [airplane]
      end

      it "raises an error when the airport is full" do
        described_class::DEFAULT_CAPACITY.times { airport.land_plane(airplane) }
        expect { airport.land_plane(airplane).to raise_error "Plane cannot land. The airport is full"}
      end
    end

    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      it "raises an error when the weather is stormy" do
        allow(airport).to receive(:stormy?).and_return(true)
        expect{ airport.land_plane(airplane) }.to raise_error("Plane cannot land due to stormy weather")
      end
    end

  end

  describe '#take_off' do

    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      it "instructs a plane to take off" do
        airport.land_plane(airplane)
        expect(airport.take_off(airplane)).to eq airplane
      end

      it "confirms a plane has taken off" do
        landed_planes = airport.land_plane(airplane)
        airport.take_off(airplane)
        expect(landed_planes).to eq []
      end

      it "only takes off landed planes at the airport" do
        airport.land_plane(airplane)
        airport2 = described_class.new
        expect{ airport2.take_off(airplane) }.to raise_error "Plane cannot take off as it is not at this airport"
      end
    end

    context 'when stormy' do
      it "raises an error when the weather is stormy" do
        allow(airport).to receive(:stormy?).and_return(false)
        airport.land_plane(airplane)
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.take_off(airplane) }.to raise_error "Plane cannot take off due to stormy weather"
      end
    end

  end

end
