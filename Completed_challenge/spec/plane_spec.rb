require 'plane'

describe Plane do

  it { is_expected.to respond_to :parked? }

  let (:plane) {Plane.new}


  describe "#leave" do
    it "The plane has taken off" do
      plane.land
      plane.leave
      expect(plane.parked?).to eq false
    end
  end

  describe "#land" do
    it "The plane has landed" do
      plane.land
      expect(plane.parked?).to eq true
    end
  end

  end
