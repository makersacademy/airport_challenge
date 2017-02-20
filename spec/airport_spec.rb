require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }

  describe 'initialization' do
    it "is initialized with an empty array of planes" do
      expect(airport.planes).to eq []
    end

    it "is initialized with a default capacity of 10" do
      expect(airport.capacity).to eq 10
    end

    it "allows the user to overide the default capacity when creating a new airport" do
      expect((Airport.new 20).capacity).to eq 20
    end

  end

  describe "keeps track of planes" do

    before :each do
      @plane = Plane.new
      allow(@plane).to receive(:stormy?).and_return(false)
    end

    it "can keep track of a plane that has landed" do
      @plane.land(airport)
      expect(airport.planes).to eq [@plane]
    end

    describe '.full?' do
      it "checks if the airport is full" do
        ten_planes = []
        10.times {ten_planes << Plane.new}
        airport.instance_variable_set(:@planes, ten_planes)
        expect(airport).to be_full
      end
    end
  end

end
