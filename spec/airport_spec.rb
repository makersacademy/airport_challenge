require 'spec_helper'
require 'airport'
require 'weather_report'
require 'plane'

describe Airport do
  context 'airport is not full and weather is not stormy' do
    before(:each) do
      @airport = Airport.new(2)
      @plane = Plane.new
      allow(@airport).to receive(:permission_to_land_granted?) { true }
    end
    it 'allows planes to land' do
      @airport.tower_permission_to_land(@plane)
      expect(@airport.ground_control_call).to eq 1
    end
    it 'allows planes to take off' do
      @airport.tower_permission_to_land(@plane)
      @airport.tower_permission_to_takeoff(@plane)
      expect(@airport.ground_control_call).to eq 1
    end
    it 'denies land request from a plane that is already grounded' do
      expect(@airport.tower_permission_to_land(Plane.new(1))).to eq 'Request denied'
    end
    it 'denies takeoff request from a plane that is already in air' do
      expect(@airport.tower_permission_to_takeoff(Plane.new)).to eq 'Request denied'
    end  
  end
  context 'airport is full and weather is not stormy' do
    before(:each) do
      @airport = Airport.new(1)
      @plane = Plane.new
      @airport.tower_permission_to_land(@plane)
      @airport.stub(:weather_good?) { true }
    end
    it 'does not allow planes to land' do
      expect(@airport.tower_permission_to_land(Plane.new)).to eq 'Request denied'
    end
    it 'verifies that plane has taken off' do
      @airport.tower_permission_to_takeoff(@plane)
      expect(@airport.ground_control_call).to eq 0
    end
  end
  context 'weather is stormy' do
    before(:each) do
      @airport = Airport.new(2)
      @plane = Plane.new
      @parked_plane = Plane.new(1)
      @airport.stub(:ground_control_call) { 1 }
      @airport.stub(:weather_good?) { false }
    end
    it 'does not allow planes to land' do
      expect(@airport.tower_permission_to_land(@plane)).to eq 'Request denied'
    end
    it 'does not allow planes to take off' do
      expect(@airport.tower_permission_to_takeoff(@parked_plane)).to eq 'Request denied'
    end
  end
end
