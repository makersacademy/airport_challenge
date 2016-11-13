require 'airport'
require 'plane'
require 'weather'

describe Airport do

  it "responds to the instruction to land a plane" do
    expect(subject).to respond_to :land_plane
    #it { is_expected.to respond_to :land_plane }
  end

  it "allows a plane to land" do
    plane = subject.land_plane
    plane.landed?
  end

  it "responds to the instruction to takeoff a plane" do
    expect(subject).to respond_to :take_off
    #it { is_expected.to respond_to :take_off }
  end

  it "allows a plane to takeoff" do
    plane = subject.take_off
    plane.taken_off?
  end

  #describe "stormy weather" do
    it "raises an error when the weather is stormy" do
      expect(subject).to respond_to :weather_conditions
      #if weather_conditions == @stormy
      #expect { subject.take_off }.to raise_error "Bad weather - no planes can take off"
      #else land_plane
      #end
    end
  #end

end
