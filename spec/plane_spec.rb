require "plane.rb"

def set_sunny(state)
  weather = class_double("Weather").as_stubbed_const
  allow(weather).to receive(:sunny?) { state }
end

# THIS APPROACH DIDN'T WORK - WHY?
# def set_airport(name)
#   airport = instance_double("Airport")
#   allow(airport).to receive(:airport_name) { "Paris" }
# end

describe Plane do

  subject(:plane) { Plane.new }

  describe ".land" do

    it { is_expected.to respond_to(:land) }
    it { is_expected.to respond_to(:land).with(1).argument }

    context "plane is airborne" do

      context "weather is sunny" do
        before(:each) do
          #ASK COACH WHY I CANNOT PUT THE WEATHER CLASS DOUBLE IN THE LEVEL ABOVE
          set_sunny(true)
          #ASK COACH WHY I CANNOT CREATE THE AIRPORT INSTANCE DOUBLE OUTSIDE OF THE IT STATEMENTS
          # set_airport("Paris")
        end
        it "can land" do
          airport = instance_double("Airport")
          allow(airport).to receive_messages(airport_name: "Paris", full?: false)
          allow(airport).to receive(:dock)
          expect{plane.land(airport)}.not_to raise_error
        end
        it "confirms it has landed" do
          airport = instance_double("Airport")
          allow(airport).to receive_messages(airport_name: "Paris", full?: false)
          allow(airport).to receive(:dock)
          expect(plane.land(airport)).to include "Plane has landed"
        end
        it "confirms it has landed at the correct airport" do
          airport = instance_double("Airport")
          allow(airport).to receive_messages(airport_name: "Paris", full?: false)
          allow(airport).to receive(:dock)
          expect(plane.land(airport)).to eq "Plane has landed in sunny weather at Paris"
        end
        it "is no longer airborne" do
          airport = instance_double("Airport")
          allow(airport).to receive_messages(airport_name: "Paris", full?: false)
          allow(airport).to receive(:dock)
          plane.land(airport)
          expect(plane.airborne).to be false
        end
        it "docks with airport" do
          airport = instance_double("Airport")
          allow(airport).to receive_messages(airport_name: "Paris", full?: false)
          allow(airport).to receive(:dock)
          allow(airport).to receive(:planes) { [plane] }
          plane.land(airport)
          expect(airport.planes).to include plane
        end
        context "airport is full" do
          it "cannot land" do
            airport=instance_double("Airport")
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
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          expect {plane.land(airport)}.to raise_error(RuntimeError, "Cannot land - weather is stormy!")
        end
      end
    end

    context "plane is not airborne" do
      subject(:plane) { Plane.new(false) }
      it "cannot land" do
        airport = instance_double("Airport")
        allow(airport).to receive(:airport_name) { "Paris" }
        expect {plane.land(airport)}.to raise_error(RuntimeError, "Cannot land - already landed!")
      end
    end

  end

  describe ".take_off" do

    it { is_expected.to respond_to(:take_off) }
    it { is_expected.to respond_to(:take_off).with(1).argument }

    context "plane is airborne" do
      it "cannot take off" do
        airport = instance_double("Airport")
        allow(airport).to receive(:airport_name) { "Paris" }
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
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          expect{plane.take_off(airport)}.not_to raise_error
        end
        it "confirms it has taken off" do
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          expect(plane.take_off(airport)).to include "Plane has taken off"
        end
        it "confirms it has taken off from the correct airport" do
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          expect(plane.take_off(airport)).to eq "Plane has taken off from Paris"
        end
        it "is now airborne" do
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          plane.take_off(airport)
          expect(plane.airborne).to be true
        end
        it "docks with airport" do
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          allow(airport).to receive(:undock)
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
          airport = instance_double("Airport")
          allow(airport).to receive(:airport_name) { "Paris" }
          expect { plane.take_off(airport) }.to raise_error(RuntimeError, "Cannot take off - weather is stormy!")
        end
      end


    end


  end

end
