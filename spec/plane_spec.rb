require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  context "#land" do
    it "Expects a plane to respond to #land with an argument" do
      expect(plane).to respond_to(:land).with(1).argument
    end

    it "Expects plane to run a landing schedule after landing call" do
      expect(plane.land(airport)).to eq true
    end

    it "Expects plane to have true #landed attribute once landing_schedule" do
      plane.land(airport)
      expect(plane.landed).to eq true
    end
  end

  context "#landed" do
    it { is_expected.to respond_to :landed }


    it "Expects a plane to confirm it has landed after it has" do
      plane.land(airport)
      expect(plane.confirm_landed).to eq "#{plane} has landed"
    end

    it "Expects a plane to inform it has not landed if requested before landing" do
      expect(plane.confirm_landed).to eq "#{plane} is still in the air"
    end
  end

  context "#take_off" do
      it { is_expected.to respond_to :take_off }

      it "Expects a plane to change #landed status once taken off" do
        plane.take_off
        expect(plane.landed).to eq false
      end
  end


end
