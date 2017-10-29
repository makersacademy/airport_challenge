require 'airport'
require 'plane'
describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) {Plane.new}


  describe 'attributes' do

    it "verify if :planes return an array" do
      expect(airport.planes).to be_an_instance_of(Array)
    end

    it { expect(airport).to respond_to(:weather)}

  end

  describe '#land' do

    it { expect(airport).to respond_to(:land).with(1).argument }

    it "raise error if plane landed in another airport already" do
      plane.landed = true
      expect{airport.land(plane)}.to raise_error("plane already landed")
    end

    it "check if the plane in the airport after landing" do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

  end

  describe '#take_off' do

    it { expect(airport).to respond_to(:take_off).with(1).argument }

    it "remove plane from airport after take_off" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end

  end

end
