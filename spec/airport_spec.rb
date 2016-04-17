require 'airport.rb'
require 'rspec/expectations'


describe Airport do
  subject(:airport) { described_class.new }
  let(:landed_plane) {double :landed_plane, landed?: true}
  let(:plane) {double :plane, landed?: false}

    it { expect(subject).to respond_to(:accept_for_landing).with(1).argument}
    it { expect(subject).to respond_to(:accept_for_take_off).with(1).argument}
    it {expect(subject).to respond_to(:airport_space)}

    describe '#initialize' do
      it "airport has a variable capacity" do
        capacity = 123
        airport = Airport.new(capacity)
        expect(airport.capacity).to eq capacity
      end
    end
      it "sets the the capacity to default value when capacity is not provided" do
    	  expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
      end
      describe '#airport_space' do
        it "has parking space" do
           expect(subject.airport_space).to eq []
        end
      end
       describe '#accept_for_landing' do
          it "accepts one plane for landing" do
            allow(plane).to receive(:airport_space)
            subject.accept_for_landing(plane)
            expect(subject.airport_space).to eq [plane]
          end
      end
    # it "raises an error message when the weather is too stormy to land" do
         #   #  subject.accept_for_landing(plane)
         #   #  expect(subject.planes)).to include plane
         #  expect {subject.accept_for_landing}.to raise_error("It's too stormy to land")

         it "raises exception if Airport is full" do
           subject.capacity.times {subject.accept_for_landing(plane)}
           expect {subject.accept_for_landing(plane)}.to raise_error("Airport is full")
         end
       #end
        describe '#accept_for_take_off' do
          it "sets the planes into the air " do
    #     #allow(plane).to receive(:stormy?).and_return(false)
            allow(plane).to receive(:acceprt_for_take_off)
            subject.accept_for_landing(plane)
            subject.accept_for_take_off(plane)
            expect(subject.airport_space).to eq []
          end
        end
      # it "raises an error if the weather is stormy for take off" do
      #   subject.accept_for_landing(plane)
      #   subject.accept_for_take_off(plane)
      #   expect {subject.accept_for_take_off}.to raise_error("It's too stormy to takeoff")

  #      it "after it took off it will no longer exist in the airport" do
  #	      subject.accept_for_landing(plane)
			#   subject.acceprt_for_take_off
			#   expect(subject.planes).to eq []
      # end
    describe '#stormy?' do
       it "if random number for weather is > 6" do
         allow(subject).to receive(:rand) {7}
         expect(subject.stormy?).to eq true
       end
    end
       it "if random number for weather is =< 6" do
         allow(subject).to receive(:rand) {6}
         expect(subject.stormy?).to eq false
       end
end
