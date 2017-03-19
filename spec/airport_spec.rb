require 'airport'

describe Airport do

  subject(:airport) {Airport.new}
  let(:airplane) {double :airplane}

  describe 'initialization' do

    it 'sets airport capacity equal to the default capacity if no argument is passed' do
      allow(airport).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { airport.land_plane(airplane) }
      expect { airport.land_plane(airplane) }.to raise_error "Plane cannot land. The airport is full"
    end

    it 'overrides the default capacity with the argument passed' do
      random_capacity = rand(1..1000)
      heathrow = Airport.new(random_capacity)
      allow(heathrow).to receive(:stormy?).and_return(false)
      random_capacity.times { heathrow.land_plane(airplane) }
      expect { heathrow.land_plane(airplane) }.to raise_error "Plane cannot land. The airport is full"
    end

  end

  describe '#land_plane' do

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it "instructs a plane to land" do
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.land_plane(airplane)).to eq [airplane]
    end

    it "confirms plane has landed" do
      allow(airport).to receive(:stormy?).and_return(false)
      allow(airplane).to receive(:landed?).and_return(true)
      heathrow = airport.land_plane(airplane)
      expect(heathrow[-1].landed?).to be_truthy
    end

    it "raises an error when the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      expect{ airport.land_plane(airplane) }.to raise_error("Plane cannot land due to stormy weather")
    end

    it "raises an error when the airport is full" do
      allow(airport).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { airport.land_plane(airplane) }
      expect { airport.land_plane(airplane).to raise_error "Plane cannot land. The airport is full"}
    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "instructs a plane to take off" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land_plane(airplane)
      expect(airport.take_off(airplane)).to eq airplane
    end

    it "confirms a plane has taken off" do
      allow(airport).to receive(:stormy?).and_return(false)
      landed_planes = airport.land_plane(airplane)
      airport.take_off(airplane)
      expect(landed_planes).to eq []
    end

    it "only takes off landed planes at the airport" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land_plane(airplane)
      airport2 = Airport.new
      expect{ airport2.take_off(airplane) }.to raise_error "Plane cannot take off as it is not at this airport"
    end


    it "raises an error when the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land_plane(airplane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.take_off(airplane) }.to raise_error "Plane cannot take off due to stormy weather"
    end


  end

end
