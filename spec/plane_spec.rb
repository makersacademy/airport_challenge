require "plane.rb"

def set_sunny(state)
  weather = class_double("Weather").as_stubbed_const
  allow(weather).to receive(:sunny?) { state }
end

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { instance_double("Airport") }
  
  before(:each) do
    allow(airport).to receive_messages(airport_name: "Paris", full?: false)
    allow(airport).to receive(:dock)
    allow(airport).to receive(:undock)
  end

  describe ".land" do
    context "plane is airborne" do
      context "weather is sunny" do
        before(:each) do
          set_sunny(true)
        end
        it "can land" do
          expect{plane.land(airport)}.not_to raise_error
        end
        it "confirms it has landed" do
          expect(plane.land(airport)).to include "Plane has landed"
        end
        it "confirms it has landed at the correct airport" do
          expect(plane.land(airport)).to eq "Plane has landed in sunny weather at Paris"
        end
        it "is no longer airborne" do
          plane.land(airport)
          expect(plane.airborne).to be false
        end
        it "docks with airport" do
          allow(airport).to receive(:planes) { [plane] }
          plane.land(airport)
          expect(airport.planes).to include plane
        end
        context "airport is full" do
          it "cannot land" do
            allow(airport).to receive(:full?) { true }
            expect{plane.land(airport)}.to raise_error(RuntimeError,"Cannot land - airport is full!")
          end
        end
      end

      context "weather is stormy" do
        before(:each) do
          set_sunny(false)
        end
        it "cannot land" do
          expect {plane.land(airport)}.to raise_error(RuntimeError, "Cannot land - weather is stormy!")
        end
      end
    end

    context "plane is not airborne" do
      subject(:plane) { Plane.new(false) }
      it "cannot land" do
        expect {plane.land(airport)}.to raise_error(RuntimeError, "Cannot land - already landed!")
      end
    end

  end

  describe ".take_off" do
    before(:each) do
      allow(airport).to receive_messages(has_plane_docked?: true)
    end

    context "plane is airborne" do
      it "cannot take off" do
        expect {plane.take_off(airport)}.to raise_error(RuntimeError, "Cannot take off - already airborne!")
      end
    end

    context "plane is not airborne" do
      subject(:plane) { Plane.new(false) }

      context "weather is sunny" do
        before(:each) do
          set_sunny(true)
        end
        it "can be instructed to take off" do
          expect{plane.take_off(airport)}.not_to raise_error
        end
        it "confirms it has taken off" do
          expect(plane.take_off(airport)).to include "Plane has taken off"
        end
        it "cannot be instructed to take off from an airport it is not docked at" do
          wrong_airport = instance_double("Airport")
          allow(wrong_airport).to receive_messages(airport_name: "Frankfurt", has_plane_docked?: false)
          allow(wrong_airport).to receive(:undock)
          expect{plane.take_off(wrong_airport)}.to raise_error(RuntimeError,"Cannot take off - am not landed at Frankfurt!")
        end
        it "confirms it has taken off from the correct airport" do
          expect(plane.take_off(airport)).to eq "Plane has taken off from Paris"
        end
        it "is now airborne" do
          plane.take_off(airport)
          expect(plane.airborne).to be true
        end
        it "undocks with airport" do
          allow(airport).to receive(:planes) { [] }
          plane.take_off(airport)
          expect(airport.planes).not_to include plane
        end
      end

      context "weather is stormy" do
        before(:each) do
          set_sunny(false)
        end
        it "cannot take off" do
          expect { plane.take_off(airport) }.to raise_error(RuntimeError, "Cannot take off - weather is stormy!")
        end
      end
    end
  end
end
