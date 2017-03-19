require 'airport'

describe Airport do
let(:airplane) {Airplane.new}

  it { is_expected.to respond_to :land_plane }

  describe '#land_plane' do

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it "instructs a plane to land" do
      expect(subject.land_plane(airplane)).to eq [airplane]
    end

    it "confirms plane has landed" do
      allow(airplane).to receive(:landed?).and_return(true)
      heathrow = subject.land_plane(airplane)
      expect(heathrow[-1].landed?).to be_truthy
    end

  end

  describe '#take_off' do

    it "instructs a plane to take off" do
      subject.land_plane(airplane)
      expect(subject.take_off).to eq airplane
    end

    it "confirms plane has taken off" do
      landed_planes = subject.land_plane(airplane)
      subject.take_off
      expect(landed_planes).to eq []
    end

  end

end
