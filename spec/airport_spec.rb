
require 'spec_helper'
require 'airport'
require 'plane'

  describe Airport do

    let(:plane) { Plane.new }
    let(:airport) { Airport.new }

    it { is_expected.to respond_to :land_plane}

    it "instructs a plane to land" do
      allow(airport).to receive(:random_weather) { 'sunny' }
      expect(airport.land_plane(plane)).to eq "Plane has landed"
    end

    it "will not allow a plane to land if it is stormy" do
      allow(airport).to receive(:random_weather) { 'stormy' }
      expect(airport.land_plane(plane)).to eq   "Plane cannot land as it is stormy"
    end

    it "instructs a plane to take off and confirms it is no longer at the airport" do
      allow(airport).to receive(:random_weather) { 'sunny' }
      expect(airport.take_off(plane)).to eq "the plane has taken off"
      end

      it "will not allow a plane to take off if it is stormy" do
        allow(airport).to receive(:random_weather) { 'stormy' }
        expect(airport.take_off(plane)).to eq "plane cannot take off, it's stormy"
      end

    describe '#land_plane_full'
     it "will not allow a plane to land if the airport is full" do
       Airport::DEFAULT_CAPACITY.times {  subject.land_plane_full(plane) }
        expect(subject.land_plane_full(plane)).to eq "plane cannot land as the airport is full"
      end


  end
