require 'spec_helper'
require 'helpers/airport_helpers'
require 'airport'

  describe Airport do

    include AirportHelpers

    let(:landing_plane) { double(location: 'in transit', lands: true, takes_off: true) }
    let(:new_plane) { double(location: 'factory') }
    let(:test_airport) { Airport.new('Airport') }

    feature "Has a capacity" do
      context "That has a default" do

        it "Has a default capacity" do
          expect(test_airport.capacity).to eq Airport::DEFAULT_CAPACITY
        end

      end
      context "But can be set when needed" do

        it 'capacity can be set' do
          new_capacity = 50
          expect(Airport.new('Airport', new_capacity).capacity).to eq new_capacity
        end

      end
    end

    feature "Instructs a plane to move to the Airport Hangar" do
      context "But can't do this because" do

        it 'only newly made planes are moved to Hangar' do
          expect { move_not_new_plane_to_hangar }.to raise_error "Only newly made planes can be moved to Hangar"
        end

        it 'Full hangar' do
          overrides_weather_and_plane_location
          fills_airport_to_capacity
          expect { move_new_plane_to_hangar }.to raise_error "The hangar is full"
        end

      end
      context "Upon a successful move" do

        it 'A new plane is in the hangar' do
          allow(new_plane).to receive(:update_location)
          move_new_plane_to_hangar
          expect(test_airport.hangar[-1]).to eq new_plane
        end

      end
    end

    feature "Instructs a plane to land" do
      context "But it can't land due to" do

        it "Plane not in_flight" do
          overrides_weather
          expect { lands_a_new_plane }.to raise_error "Plane is not flying"
        end

        it "Full hangar" do
          overrides_weather_and_plane_location
          fills_airport_to_capacity
          expect { lands_a_plane }.to raise_error "The hangar is full"
        end

        it "Bad weather" do
          sets_weather_to_stormy
          expect { lands_a_plane }.to raise_error "Bad weather"
        end

      end
      context "Upon a successful land" do

        it "Landed plane is the last plane in the hangar" do
          overrides_weather_and_plane_location
          expect(lands_a_plane[-1]).to eq test_airport.hangar[-1]
        end

      end
    end

    feature "Instucts a plane to take_off" do
      context "But it can't take_off because" do

        it "Plane is not at the Airport" do
          overrides_weather_and_plane_location
          lands_a_plane
          expect { plane_takes_off }.to raise_error "Plane not at this Airport"
        end

        it "Bad weather" do
          overrides_weather_and_plane_location
          lands_a_plane
          sets_plane_location
          sets_weather_to_stormy
          expect { plane_takes_off }.to raise_error "Bad weather"
        end

      end
      context "Upon a successful take_off" do

        it "The plane is released from the Airport" do
          overrides_weather_and_plane_location
          lands_a_plane
          sets_plane_location
          expect(plane_takes_off).to eq landing_plane
        end

      end
    end
  end
