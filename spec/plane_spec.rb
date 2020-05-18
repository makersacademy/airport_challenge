require_relative '../lib/plane.rb'

describe Plane do ## need to used Doubles for the airport responses

  let(:airport_a) { double(:airport_a) }
  let(:airport_b) { double(:airport_b) }
  before(:each) do
    @plane_a = Plane.new
    @plane_b = Plane.new
  end

  describe '#land_at(airport)' do
    it "should be at the airport it landed at,and tell the operator that it landed" do
      allow(airport_a).to receive(:landing_ok?).and_return(true)
      expect { @plane_a.land_at(airport_a) }.to output("landed at #{airport_a}\n").to_stdout
    end
    it "should only be able to land if it is flying, and tell the operator about the problem" do
      allow(airport_a).to receive(:landing_ok?).and_return(true)
      allow(airport_b).to receive(:landing_ok?).and_return(true)
      @plane_a.land_at(airport_a)
      expect { @plane_a.land_at(airport_b) }.to output("currently located at #{airport_a} so can not land\n").to_stdout
    end
  end

  describe '#takeoff_from(airport)' do
    it "should leave airport and begin flying, and tell the operator it departed" do
      allow(airport_a).to receive(:landing_ok?).and_return(true)
      allow(airport_a).to receive(:takeoff_ok?).and_return(true)
      @plane_a.land_at(airport_a)
      expect { @plane_a.takeoff_from(airport_a) }.to output("departed #{airport_a}\n").to_stdout
    end
    it "shouldn't takeoff from somewhere it is not, and tell the operator about the problem" do
      allow(airport_a).to receive(:landing_ok?).and_return(true)
      allow(airport_b).to receive(:takeoff_ok?).and_return(true)
      @plane_a.land_at(airport_a)
      expect { @plane_a.takeoff_from(airport_b) }.to output("currently located at #{airport_a} so can not takeoff\n").to_stdout
    end
  end
end
