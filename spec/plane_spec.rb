require 'plane'

describe Plane do

  subject(:plane) { Plane.new }
  it { is_expected.to respond_to(:land_plane_confirmation) }
  it { is_expected.to respond_to(:takeoff_plane_cofirmation) }
  it { is_expected.to respond_to(:airport_max_capacity) }
  it { is_expected.to respond_to(:stormy_weather) }

  context "#land_plane_confirmation" do
    it "confirms the plane has landed" do
      expect(plane.land_plane_confirmation).to eq "Plane landed at the airport"
    end
  end

  context "#takeoff_plane_cofirmation" do
    it "confirms the plane departure from the airport" do
      expect(plane.takeoff_plane_cofirmation).to eq "Plane departed from the aeroport!"
    end
  end

  context "#airport_max_capacity" do
    it "displayes the maximum capcacity when airport full" do
    expect(plane.airport_max_capacity).to eq "The airport is at maximum capacity"
  end
 end

  context "#stormy_wether" do
    it "canceles the flight when weather is stormy" do
    expect(plane.stormy_weather).to eq "The flight is canceled due to stormy weather"
  end
 end
end
