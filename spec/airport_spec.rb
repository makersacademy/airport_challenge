require 'airport'

describe Airport do

  subject(:airport) {Airport.new}
  let(:airplane) {Airplane.new}

  describe '#land_plane' do

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it "instructs a plane to land" do
      expect(airport.land_plane(airplane)).to eq [airplane]
    end

    it "confirms plane has landed" do
      allow(airplane).to receive(:landed?).and_return(true)
      heathrow = airport.land_plane(airplane)
      expect(heathrow[-1].landed?).to be_truthy
    end

  end

  describe '#take_off' do

    it "instructs a plane to take off" do
      airport.land_plane(airplane)
      expect(airport.take_off).to eq airplane
    end

    it "confirms a plane has taken off" do
      landed_planes = airport.land_plane(airplane)
      airport.take_off
      expect(landed_planes).to eq []
    end

    it "raises an error when the weather is stormy" do
      allow(airport).to receive(:stormy?).and_return(true)
      airport.land_plane(airplane)
      expect { airport.take_off }.to raise_error "Plane cannot take off due to stormy weather"
    end


  end

end
