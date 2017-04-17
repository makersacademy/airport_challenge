require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  context "#land" do
    it "Expects a plane to respond to #land with an argument" do
      expect(plane).to respond_to(:land).with(1).argument
    end

    it { is_expected.to respond_to :landed }

    it "Expects plane to run a landing schedule after landing call" do
      expect(plane.land(airport)).to eq true
    end

    it "Expects plane to have true #landed attribute once landing_schedule" do
      plane.land(airport)
      expect(plane.landed).to eq true
    end

  end
end
