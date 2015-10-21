require 'spec_helper'
require 'helpers/plane_helpers'
require 'plane'

  describe Plane do

    include PlaneHelpers

    let(:plane) { Plane.new }

    feature "A plane lands" do

      context "But can't because" do

        it "Plane is on the ground" do
          expect {plane.lands}.to raise_error "The plane is already on the ground"
        end

        it "only an Airport can instruct it do so" do
          set_plane_location_to_in_transit
          plane_takes_off
          expect {plane.lands}.to raise_error "Only Airports can tell Planes to land"
        end

      end
      context "Upon a successful land" do

        it "in_flight is changed to false" do
          set_plane_location_to_in_transit
          plane_takes_off
          plane.update_location('not in transit')
          plane.lands
          expect(plane.in_flight).to eq false
        end

      end
    end

    feature "A plan takes off" do
      context "But can't because" do

        it "Only an Airport can instruct it do so" do
          expect {plane_takes_off}.to raise_error "Only Airports can tell Planes to take off"
        end

        it "Plane is already flying" do
          set_plane_location_to_in_transit
          plane_takes_off
          expect {plane_takes_off}.to raise_error "The plane is already flying"
        end

      end
      context "Upon a successful take off" do

        it "in_flight is changed to true" do
          set_plane_location_to_in_transit
          plane_takes_off
          expect(plane.in_flight).to eq true
        end

      end
    end

    feature "Plane updates location" do

        it "which works" do
          plane.update_location('New Location')
          expect(plane.location).to eq 'New Location'
        end

    end
  end
