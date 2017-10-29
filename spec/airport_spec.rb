require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }


  describe 'attributes' do

    it "verify if :planes return an array" do
      expect(airport.planes).to be_an_instance_of(Array)
    end

    it { is_expected.to respond_to(:weather)}

  end

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it "check if the plane in the airport after landing" do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it "remove plane from airport after take_off" do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end

  end

end
