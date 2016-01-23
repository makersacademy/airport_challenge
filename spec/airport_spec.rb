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
        subject.land(plane)
      end

      it "Can #land(plane) in airport and then see it in the holding_bay" do
        expect(subject.holding_bay).to eq [plane]
      end





    context "Can #take_off plane from airport" do

      describe "#take_off" do

        it {is_expected.to respond_to(:take_off)}

        before do
          allow(plane).to receive(:change_status)
          subject.land(plane)
        end

        it "Releases a plane from the holding_bay" do
          expect(subject.take_off).to eq plane
        end
      end
    end
      #capacity questions here.

    end
  end
end
