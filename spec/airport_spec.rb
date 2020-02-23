require 'airport'
require 'plane'
require 'weather'

describe Airport do



  let(:airport) { described_class.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context '#land_plane'

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it "accepts planes to land" do
      plane.land?
      expect{airport.land_plane(plane)}.to change{airport.plane_count}.by 1
    end

    it "raises an error if airport is full" do
      10.times {airport.land_plane(plane)}
      expect{airport.land_plane(plane)}.to raise_error("There is no space!")
    end

    it "raises an error if weather is stormy" do
      expect{airport.land_plane(plane)}.to raise_error("Too stormy to land!") if weather.stormy?
    end




  context '#take_off'

    it "allows planes to take off" do
      airport.land_plane(plane)
      expect{airport.take_off(plane)}.to change{airport.plane_count}.by -1
    end

    it "raises and error if there are no planes" do
      expect{airport.take_off(plane)}.to raise_error "There are no planes!"
    end

    

end
