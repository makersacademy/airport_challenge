
require 'spec_helper'
require 'airport'
require 'plane'

  describe Airport do

    let(:plane) { double(Plane.new) }
    let(:airport) { (Airport.new) }

    it { is_expected.to respond_to :land_plane}
    it { is_expected.to respond_to :random_weather}

#I want to instruct a plane to land at an airport and confirm that it has landed
    it "instructs a plane to land" do
      allow(airport).to receive(:random_weather) { 'sunny' }
      expect(airport.land_plane(plane)).to eq "Plane has landed"
    end

#I want to prevent landing when weather is stormy
    it "will not allow a plane to land if it is stormy" do
      allow(airport).to receive(:random_weather) { 'stormy' }
      expect(airport.land_plane(plane)).to eq   "Plane cannot land as it is stormy"
    end

#I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it "instructs a plane to take off and confirms it is no longer at the airport" do
      allow(airport).to receive(:random_weather) { 'sunny' }
      expect(airport.take_off(plane)).to eq "the plane has taken off"
      end

#I want to prevent takeoff when weather is stormy
      it "will not allow a plane to take off if it is stormy" do
        allow(airport).to receive(:random_weather) { 'stormy' }
        expect(airport.take_off(plane)).to eq "plane cannot take off, it's stormy"
      end

#I want to prevent landing when the airport is full
    describe '#land_plane_full'
     it "will not allow a plane to land if the airport is full" do
       Airport::DEFAULT_CAPACITY.times {  subject.land_plane_full(plane) }
       expect(subject.land_plane_full(plane)).to eq "plane cannot land as the airport is full"
      end

#I would like a default airport capacity that can be overridden as appropriate
    it "will allow the airport default capacity to be overridden" do
      airport = Airport.new(3)
      expect(airport.capacity).to eq 3
    end

    it "will not allow a plane that has landed to land again" do
      landing_plane = plane
      allow(airport).to receive(:random_weather) { 'sunny' }
      airport.land_plane(landing_plane)
      expect{airport.land_plane(landing_plane)}.to raise_error "error - that plane has already landed"
    end


  end
