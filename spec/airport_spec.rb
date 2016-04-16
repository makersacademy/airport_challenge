require 'airport'

describe Airport do

  let(:plane){double :plane, landed?: true}
  let(:weather){double :weather, stormy?: false}
  subject(:airport){ described_class.new(weather) }

  it {is_expected.to respond_to :land_plane}
  it {is_expected.to respond_to :take_off}

  describe '#land_plane' do

    it "lands a plane" do
      airport.land_plane(plane)
      expect(airport.planes).to include plane
    end

    it "doesn't land a plane if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{airport.land_plane(plane)}.to raise_error('Too stormy for landing')
    end

    it "doesn't #land_plane if full?" do
      airport.capacity.times { airport.land_plane plane}
      expect{airport.land_plane plane}.to raise_error "Airport full"
    end

  end

  describe '#take_off' do

    it "#take_off" do
      airport.land_plane plane
      allow(plane).to receive(:flying).and_return(false)
      expect(airport.take_off(plane)).to eq plane
    end

    it "doesn't #take_off if stormy?" do
      airport.land_plane plane
      allow(weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:flying).and_return(false)
      expect{airport.take_off(plane)}.to raise_error('Too stormy for take-off')
    end

  end

  it "will take different values for capacity" do
    array = (1..10).to_a
    array.each do |x|
      airport = Airport.new weather, x
      x.times {airport.land_plane plane}
      expect{airport.land_plane plane}.to raise_error"Airport full"
    end
  end

end
