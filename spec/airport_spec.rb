require 'airport'
require 'plane'

describe Airport do



  let(:airport) { described_class.new }
  let(:plane) { Plane.new }


  it "starts with no planes in it" do
    expect(subject.plane_count).to eq 0
  end

  before do
    allow(airport).to receive(:stormy?) {false}
  end

  context '#land_plane'

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it "accepts planes to land" do
      plane.land?
      expect{airport.land_plane(plane)}.to change{airport.plane_count}.by 1
    end

    it "raises an error if airport is full" do
      Airport::DEFAULT_CAPACITY.times {airport.land_plane(plane)}
      expect{airport.land_plane(plane)}.to raise_error("Airport full, there is no space!")
    end

    it "raises an error if weather is stormy" do
      expect(airport).to receive(:stormy?).and_return(true)
      plane.land?
      expect{airport.land_plane(plane)}.to raise_error("Too stormy to land!")
    end




  context '#take_off'

    it "allows planes to take off" do
      airport.land_plane(plane)
      expect{airport.take_off(plane)}.to change{airport.plane_count}.by -1
    end

    it "raises and error if there are no planes" do
      expect{airport.take_off(plane)}.to raise_error "Airport empty, there are no planes!"
    end

    it "raises an error if weather is stormy" do
      expect(airport).to receive(:stormy?).and_return(true)
      plane.take_off
      expect{airport.take_off(plane)}.to raise_error("Too stormy to take off!")
    end


end
