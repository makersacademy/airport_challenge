require 'airport.rb'
require 'rspec/expectations'


describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) {double :plane}
  let(:plane1) {double("plane")}


    it { expect(subject).to respond_to(:accept_for_landing).with(1).argument}
    it { expect(subject).to respond_to(:accept_for_take_off).with(1).argument}

    describe '#initialize' do
      it "airport has a variable capacity" do
        capacity = 123
        airport = Airport.new(capacity)
        expect(airport.capacity).to eq 123
      end
      it "sets the the capacity to default value when capacity is not provided" do
    	  expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
      end
    end
        describe '#accept_for_landing' do

          it "accepts planes for landing when the weather is fine" do
            allow(plane).to receive(:landed).and_return(false)
            allow(airport).to receive(:stormy_weather?).and_return(false)
            airport.accept_for_landing(plane)
            expect(airport.planes).to include plane
          end
          it "raises an error message when the weather is too stormy to land" do
           allow(plane).to receive(:landed).and_return(false)
           allow(airport).to receive(:stormy_weather?).and_return(true)
           expect {airport.accept_for_landing(plane)}.to raise_error("It's too stormy to land")
          end
          it "raises exception if Airport is full" do
            airport1 = Airport.new(1)
            allow(plane).to receive(:landed).and_return(false)
            allow(plane1).to receive(:landed).and_return(false)
            allow(airport1).to receive(:stormy_weather?).and_return(false)
            airport1.accept_for_landing(plane1)
           expect {airport1.accept_for_landing(plane)}.to raise_error("Airport is full")
          end
          it "will not allow planes to land when they are already on the ground" do
            allow(plane).to receive(:landed).and_return(true)
            allow(airport).to receive(:stormy_weather?).and_return(false)
            airport.accept_for_landing(plane)
            expect{airport.accept_for_landing(plane)}.to raise_error("Already landed")
          end

        end
        describe '#accept_for_take_off' do

            it "sets a plane into the air if the weather is fine" do
              allow(airport).to receive(:stormy_weather?).and_return(false)
              allow(plane).to receive(:took_off).and_return(false)
              allow(plane).to receive(:landed).and_return(true)
              allow(plane).to receive(:landed?).and_return(true)
              airport.accept_for_landing(plane)
              airport.accept_for_take_off(plane)
              expect(airport.planes).to eq []
            end
            it "raises an error when the weather is too stormy" do
              allow(plane).to receive(:landed?).and_return(true)
              allow(plane).to receive(:took_off).and_return(true)
              allow(plane).to receive(:landed).and_return(true)
              allow(airport).to receive(:stormy_weather?).and_return(false)
              airport.accept_for_landing(plane)
              allow(airport).to receive(:stormy_weather?).and_return(true)
              expect{airport.accept_for_take_off(plane)}.to raise_error("It's too stormy to takeoff")
            end

            it "it won't allow the planes to take off if they already did" do
              allow(airport).to receive(:stormy_weather?).and_return(false)
              allow(plane).to receive(:landed?).and_return(false)
              allow(plane).to receive(:landed).and_return(true)
              airport.accept_for_landing(plane)
              expect{airport.accept_for_take_off(plane)}.to raise_error("the plane is no longer in the airport")
            end
            it "will only send the plane into the sky if it's in the airport" do
              allow(plane).to receive(:landed?).and_return(false)
              allow(airport).to receive(:stormy_weather?).and_return(false)
              expect{airport.accept_for_take_off(plane)}.to raise_error("There are no planes in the Airport")
            end
        end
end
