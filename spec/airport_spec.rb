require 'airport'

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { double :plane }

  describe "#land" do
    it "Expects a plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context "when airport is full" do
      it "Raises an error" do
        10.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Plane cannot land at a full airport!"
      end
    end
  end

    describe "#take off" do
      it "Instructs a plane to take_off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
end
