
require "traffic_controller"
describe Airport do
  subject(:airport) { described_class.new(50) }
  let (:plane) { double :plane }

  describe "#land"  do
    context "when not stormy" do
      before do 
        allow(airport).to receive(:stormy?).and_return false
      end 

      it "instruct a plane to land" do 
       expect(airport).to respond_to(:land).with(1).argument
      end

      context "when full" do 
        it "raises an error" do
          allow(airport).to receive(:stormy?).and_return false
          50.times do 
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Cannot land: airoport full."
        end
      end
    end
    
    context "when stormy" do
      it "raises an error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane)  }.to raise_error "Cannot land the plane: weather is stormy"
       end
      end 
    end
    describe "#take_off" do
      context "When not stormy" do
      it "instruct a plane to take off" do 
        expect(airport).to respond_to(:take_off).with(1).argument
      end   
    end 
    context "when stormy" do 
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "raises an error" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take off plane: weather is stormy"
      end
      end
  end
end