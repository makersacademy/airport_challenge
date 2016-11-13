require 'airport.rb'

  describe Airport do

    subject(:airport) {described_class.new}
    let(:plane) { double :plane }

    context "Testing respond to methods" do

      it "should test that class airport responds to planes landing method" do
        expect(airport).to respond_to(:plane_landed).with(1).argument
      end

      it "should test that airport class response to planes method" do
        expect(airport).to respond_to :planes
      end

      it "should test that there is a response between airport class and take off method" do
        expect(airport).to respond_to :taken_off
      end

      it "should test that airport class response to capacity method" do
        expect(airport).to respond_to :capacity
      end

      it "should test that airport response to weather?" do
        expect(airport).to respond_to :stormy?
      end
    end

    context "Test landing, taking off and planes at airport in sunny weather" do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "should test that plane has landed" do
          expect(airport.plane_landed(plane)).to eq [plane]
      end

      it "should test that a plane has taken off from the airport" do
        airport.plane_landed(plane)
          expect(airport.taken_off).to eq plane
      end

      it "should test that the planes avaiable will be shown when the method planes is called" do
        airport.plane_landed(plane)
          expect(airport.planes).to eq [plane]
      end
    end


    context "Raise error" do

      it "should raise an error when the amount of planes in the airport if full and a plane is trying to land" do
        allow(airport).to receive(:stormy?).and_return false
        Airport::DEFAULT_CAPACITY.times {subject.plane_landed double(:plane)}
          expect{airport.plane_landed(plane)}.to raise_error("This airport is full to capacity, please go to the next nearest airport to land")
      end

    end

      context "Stormy weather" do

        before do
          allow(airport).to receive(:stormy?).and_return true
        end

        it "should raise an error to prevent plane from taking off" do
          expect{airport.taken_off}.to raise_error("All planes are grounded until further notice due to bad weather")
        end

        it "should raise an error that indicates a plane cannot land due to weather" do
          expect{airport.plane_landed(plane)}.to raise_error("There is a storm at destination please divert to nearest airport")
        end
    end
end
