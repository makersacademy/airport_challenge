require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}


  describe "#initialize" do
    context "All airports have holding bay for planes to be stored" do
      it {is_expected.to respond_to(:holding_bay)}

      it "Initializes new Airports with a holding bay Array" do
        expect(subject.holding_bay).to be_a Array
      end
    end
  end


  describe "#land(plane)" do

    it {is_expected.to respond_to(:land).with(1).argument}

    context "Can #land(plane) in airport" do

      before do
        allow(plane).to receive(:change_status)
        airport.stub(:sunny?).and_return(true)
        subject.land(plane)
      end

      it "Can #land(plane) in airport and then see it in the holding_bay" do
        expect(subject.holding_bay).to eq [plane]
      end
    end




    context "Can #take_off plane from airport" do

      describe "#take_off" do

        it {is_expected.to respond_to(:take_off)}

        before do
          allow(plane).to receive(:change_status)
          airport.stub(:sunny?).and_return(true)
          subject.land(plane)
        end

        it "Releases a plane from the holding_bay" do
          expect(subject.take_off).to eq plane
        end

        it "Removes a plane from the holding_bay" do
          subject.take_off
          expect(airport.holding_bay).to eq []
        end

        it "Will not release a plane from the holding_bay if it is empty" do

        end
      end
    end

    context "Behaviour due to bad/not sunny weather" do

      before do
        allow(plane).to receive(:change_status)
      end

      describe "#sunny?" do

        it {is_expected.to respond_to(:sunny?)}

        it "Will be Sunny roughly 90% of the time" do
          100.times do
            subject.land(plane)
          end
          expect(subject.holding_bay.size).to satisfy{|x| x >= 80 }
        end

        describe "#landing in whilst not sunny" do
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
            airport.land(plane)
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
end
