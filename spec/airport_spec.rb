require 'airport'

describe Airport do

  let(:plane){double :plane, landed?: true}
  let(:weather){double :weather, stormy?: false}
  subject(:airport){ described_class.new(weather) }

  describe '#land_plane' do

    it "lands a plane" do
      airport.land_plane(plane)
      expect(airport.planes).to include plane
    end

    it "doesn't land a plane if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{airport.land_plane(plane)}.to raise_error('Too stormy for landing')
    end

    it "doesn't land a plane if full?" do
      airport = Airport.new weather, 1
      plane1 = Plane.new
      airport.capacity.times { airport.land_plane plane }
      expect{airport.land_plane plane}.to raise_error "Airport full"
    end

    it "doesn't land a plane if plane is landed" do
      airport.land_plane(plane)
      expect{airport.land_plane(plane)}.to raise_error "Already landed"
    end

  end

  describe '#take_off' do

    it "lets a plane take off" do
      airport.land_plane plane
      allow(plane).to receive(:flying).and_return(false)
      expect(airport.take_off(plane)).to eq plane
    end

    it "doesn't let a plane take off if stormy?" do
      airport.land_plane plane
      allow(weather).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:flying).and_return(false)
      expect{airport.take_off(plane)}.to raise_error('Too stormy for take-off')
    end

    it "denies take off if plane isn't in airport" do
      b = Plane.new
      expect{airport.take_off(b)}.to raise_error('Plane cannot take off')
    end
  end

  it "will take different values for capacity" do
    array = ('a'..'g').to_a #needed to test multiple planes without receiving
    array.each do |x|       #a 'Plane landed' failure
      x = Plane.new
      airport = Airport.new weather, array.count
      airport.land_plane x
    end
  end

end
