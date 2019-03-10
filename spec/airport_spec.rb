require 'airport'
require 'plane'
require 'helper_methods_module'

RSpec.describe Airport do
  include Helper_Methods_Module

  let(:plane) { Plane.new }

  context "instructs plane to" do

    it "land at an airport" do
      expect(subject.land(plane)).to eq("Landed")
      expect(subject.hangar).to include(plane)
    end

    it "land at an airport only if there is space" do
    end 

  end

  context "instructs plane" do

    it "to take_off and confirm it has taken off" do 
      weather(:good)
      expect(subject.take_off(plane)).to eq("Plane has taken off")
    end

    it "prevents plane from taking off if weather is stormy" do
      weather(:bad)
      expect(subject.take_off(plane)).to eq "Stormy weather: Take off denied"
    end

  end

end
