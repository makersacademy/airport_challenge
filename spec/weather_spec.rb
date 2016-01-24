require 'weather'

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
          allow(airport).to receive(:sunny?).and_return(false)
        end

        it "Will not allow plane to land if not sunny" do
          expect(subject.land plane ).to eq("Unsafe to land plane whilst stormy")
        end

        it "Will not add another plane to the holding bay if landing whilst not sunny" do
          before = subject.holding_bay.size
          subject.land plane
          expect(subject.holding_bay.size).to eq (before)
        end

      end

      describe "#taking_off whilst not sunny" do

        before do
          allow(plane).to receive(:flying?).and_return(true)
          allow(airport).to receive(:empty?).and_return(false)
          airport.land plane
          allow(plane).to receive(:landed?).and_return(true)
          allow(airport).to receive(:sunny?).and_return(false)
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
