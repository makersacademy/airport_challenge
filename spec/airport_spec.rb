require 'airport'

describe Airport do
  subject(:airport) {described_class.new Airport::DEFAULT_CAPACITY, true}
  let(:plane) {double :plane}

  describe "#initialize" do

      context "All airports have holding bay for planes to be stored" do

        # it {is_expected.to respond_to(:holding_bay)}

        it "Initializes new Airports with a holding bay Array" do
          expect(airport.holding_bay).to be_a Array
        end

        it "Initializes new Airports with no planes in it" do
          expect(airport.holding_bay).to eq []
        end
      end

    context "All Aiports have a capacity" do

      # it {is_expected.to respond_to(:capacity)}

      it "Initializes new Airports with a capacity" do
        expect(airport.capacity).to be_a Integer
      end

      it "Intializes all new Airports with the same default capacity" do
        airport1 = described_class.new
        airport2 = described_class.new
        expect(airport1.capacity).to eq airport2.capacity
      end

      it "Allows system designer to override the default capacity with 1" do
          tiny_airport = Airport.new 1
          expect(tiny_airport.capacity).to eq 1
      end

      it "Allows the system designer to override the default capacity with 5" do
          little_airport = Airport.new 5
          expect(little_airport.capacity).to eq 5
      end

      it "Allows the system designer to override the default capacity with any number" do
        any_capacity = rand
        random_sized_airport = Airport.new any_capacity
        expect(random_sized_airport.capacity).to eq any_capacity
      end
    end
  end


  describe "#land(plane)" do

    before do
      allow(plane).to receive(:change_status)
      allow(plane).to receive(:flying?).and_return(true)
    end

    context "Can #land plane  in airport" do

      before do
        airport.land plane
      end

      it {is_expected.to respond_to(:land).with(1).argument}

      it "Can #land plane  in airport and then see it in the holding_bay" do
        expect(airport.holding_bay).to include plane
      end

      it "Cannot land a plane that has already landed" do
        allow(plane).to receive(:flying?).and_return(false)
        expect(airport.land(plane)).to eq "Plane has already landed"
      end
    end

    context "Capacity constraints" do

      describe "#full?" do
        let(:small_airport) {described_class.new 2, true}

      before do
        plane1 = double("plane1", :flying? => true, :change_status => :Landed)
        plane2 = double("plane2", :flying? => true, :change_status => :Landed)
        small_airport.land plane1
        small_airport.land plane2
      end

          it "Will not land a plane if the airport is #full?" do
            allow(plane).to receive(:flying?).and_return(true)
            expect(small_airport.land(plane)).to eq("The airport is full")
          end

      end
    end
  end


    describe "#take_off" do

      context "Can #take_off plane from airport" do

        it {is_expected.to respond_to(:take_off)}

        before do
          allow(plane).to receive(:change_status)
          allow(plane).to receive(:flying?).and_return(true)
          airport.land(plane)
          allow(plane).to receive(:landed?).and_return(true)
        end

        it "Releases a plane from the holding bay" do
          expect(airport.take_off).to eq plane
        end

        it "Removes a plane from the holding bay" do
          airport.take_off
          expect(airport.holding_bay).to eq []
        end

        it "Will not release a plane from the holding bay if it is empty" do
          airport.take_off
          expect(airport.take_off).to eq "The airport is empty"
        end

        it "Will not let a plane take off if it isn't landed" do
          allow(plane).to receive(:landed?).and_return(false)
          expect(airport.take_off).to eq "This plane is already flying"
        end

      end
    end


    context "Behaviour due to bad/not sunny weather" do

        context "#landing whilst not sunny" do
          subject(:stormy_airport) {described_class.new(10, false)}

          it "Will not allow plane to land if not sunny" do
            allow(plane).to receive(:change_status)
            allow(plane).to receive(:flying?).and_return(true)
            expect(stormy_airport.land(plane)).to eq("Unsafe to land plane whilst stormy")
          end

          it "Will not add plane to holding bay if landing whilst not sunny" do
            before = stormy_airport.holding_bay.size
            stormy_airport.land plane
            expect(stormy_airport.holding_bay.size).to eq (before)
          end

        end

        describe "#taking_off whilst not sunny" do
          subject(:stormy_airport) {described_class.new(10, false)}

          before do
            allow(plane).to receive(:change_status)
            allow(plane).to receive(:flying?).and_return(true)
            stormy_airport.land(plane)
          end

          it "Will not allow plane to take off if not sunny" do
            allow(stormy_airport).to receive(:empty?).and_return(false)
            expect(stormy_airport.take_off).to eq("Unsafe to take off plane whilst stormy")
          end

          it "Will not take off a plane from the holding bay whilst not sunny" do
            before = stormy_airport.holding_bay.size
            stormy_airport.take_off
            expect(stormy_airport.holding_bay.size).to eq (before)
          end

        end

    end

end
