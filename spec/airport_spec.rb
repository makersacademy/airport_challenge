require "airport"

describe Airport do
  subject(:airport) { described_class.new(50) }
  let(:plane) { Plane.new }

  describe "#landing" do
    context "when sunny" do

      it "instructs plane to land" do
        allow(airport).to receive(:current_weather).and_return("sunny")
        expect(airport).to respond_to(:land).with(1).argument
      end

      context "when airport is full" do
        it "does not allow landing and raises error" do
          allow(airport).to receive(:current_weather).and_return("sunny")
          50.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'Airport Full - Cannot Land'
        end
      end
    end
    context "when stormy" do
      it "raises error if attempting to land in stormy weather" do
        allow(airport).to receive(:current_weather).and_return("stormy")
        expect { airport.land(plane) }.to raise_error 'Stormy Weather - Cannot Land'
      end
    end
  end

  describe "#takeoff" do
    context "when sunny" do
      it "instructs plane to take off" do
        allow(airport).to receive(:current_weather).and_return("sunny")
        expect(airport).to respond_to(:take_off).with(1).argument
      end
      it "checks plane has left hanger" do
        allow(airport).to receive(:current_weather).and_return("sunny")
        50.times do
          airport.land(plane)
        end
        airport.take_off(plane)
        expect(airport.hanger.length).to eq(49)
      end


    end

    context "when stormy" do
      it "raises error if attempting to take off in stormy weather" do
        allow(airport).to receive(:current_weather).and_return("stormy")
        expect { airport.take_off(plane) }.to raise_error 'Stormy Weather - Cannot Take Off'
      end
    end
  end
end
