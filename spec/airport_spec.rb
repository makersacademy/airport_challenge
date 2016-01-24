require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:small_airport) {described_class.new 2}
  let(:plane) {double :plane}


    describe "#initialize" do

      context "All airports have holding bay for planes to be stored" do

        it {is_expected.to respond_to(:holding_bay)}

        it "Initializes new Airports with a holding bay Array" do
          expect(subject.holding_bay).to be_a Array
        end

        it "Initializes new Airports with no planes in it" do
          expect(subject.holding_bay).to eq []
        end
      end

    context "All Aiports have a capacity" do

      it {is_expected.to respond_to(:capacity)}

      it "Initializes new Airports with a capacity" do
        expect(subject.capacity).to be_a Integer
      end

      it "Intializes all new Airports with the same default capacity" do
        airport1 = subject
        airport2 = subject
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
    end
  end


  describe "#land(plane)" do

    before do
      allow(plane).to receive(:change_status)
      allow(plane).to receive(:flying?).and_return(true)
      airport.stub(:sunny?).and_return(true)
    end

    context "Can #land(plane) in airport" do

      before do
        airport.stub(:full?).and_return(false)
        subject.land(plane)
      end

      it {is_expected.to respond_to(:land).with(1).argument}

      it "Can #land(plane) in airport and then see it in the holding_bay" do
        expect(subject.holding_bay).to eq [plane]
      end

      it "Cannot land a plane that has already landed" do
        allow(plane).to receive(:flying?).and_return(false)
        expect(subject.land(plane)).to eq "Plane has already landed"
      end
    end

    context "Capacity constraints" do

      describe "#full?" do

      before do
        plane1 = double("plane1", :flying? => true, :change_status => "Landed")
        plane2 = double("plane2", :flying? => true, :change_status => "Landed")
        small_airport.stub(:sunny?).and_return(true)
        small_airport.land plane1
        small_airport.land plane2
      end

          it "Will not land a plane if the airport is #full?" do
            allow(plane).to receive(:flying?).and_return(true)
            expect(small_airport.land plane).to eq("The airport is full")
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
          airport.stub(:sunny?).and_return(true)
          airport.stub(:full?).and_return(false)
          subject.land(plane)
          allow(plane).to receive(:landed?).and_return(true)
        end

        it "Releases a plane from the holding bay" do
          expect(subject.take_off).to eq plane
        end

        it "Removes a plane from the holding bay" do
          subject.take_off
          expect(airport.holding_bay).to eq []
        end

        it "Will not release a plane from the holding bay if it is empty" do
          subject.take_off
          expect(subject.take_off).to eq "The airport is empty"
        end

        it "Will not let a plane take off if it isn't landed" do
          allow(plane).to receive(:landed?).and_return(false)
          expect(subject.take_off).to eq "This plane is already flying"
        end

      end
    end

  describe "#sunny?" do

      it {is_expected.to respond_to(:sunny?)}

      it "Will be Sunny roughly 90% of the time" do
        true_false_array = []
        100.times do
          subject.sunny? ? true_false_array << "sunny" : nil
        end
        expect(true_false_array.size).to satisfy{|x| x >= 80 }
      end

    context "Behaviour due to bad/not sunny weather" do

      before do
        allow(plane).to receive(:flying?).and_return(false)
        allow(plane).to receive(:change_status)
      end

        context "#landing whilst not sunny" do

          before do
            airport.stub(:sunny?).and_return(false)
          end

          it "Will not allow plane to land if not sunny" do
            expect(subject.land(plane)).to eq("Unsafe to land plane whilst stormy")
          end

          it "Will not add another plane to the holding bay if landing whilst not sunny" do
            before = subject.holding_bay.size
            subject.land(plane)
            expect(subject.holding_bay.size).to eq (before)
          end

        end

        describe "#taking_off whilst not sunny" do

          before do
            allow(plane).to receive(:flying?).and_return(true)
            airport.stub(:empty?).and_return(false)
            airport.land(plane)
            allow(plane).to receive(:landed?).and_return(true)
            airport.stub(:sunny?).and_return(false)
          end

          it "Will not allow plane to take off if not sunny" do
            expect(subject.take_off).to eq("Unsafe to take off plane whilst stormy")
          end

          it "Will not take off a plane from the holding bay whilst not sunny" do
            before = subject.holding_bay.size
            subject.take_off
            expect(subject.holding_bay.size).to eq (before)
          end
        end
      end
    end
end
