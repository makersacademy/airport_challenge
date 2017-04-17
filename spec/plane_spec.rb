require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double :airport}

  describe "#initialize" do

    context "All planes have a status that tells us if they are flying or landed" do
      it {is_expected.to respond_to(:status)}

    it "Ensures that when airtraffic control first detect a Plane.new, it is always flying" do
      expect(subject.status).to eq "Flying"
    end

  end

  context "Flying and Landing" do

      describe "#landed?" do
        it {is_expected.to respond_to(:landed?)}
        it "Returns true when landed" do
          subject.change_status
          expect(subject.landed?).to be true
        end
        it "Returns false when not landed" do
          expect(subject.landed?). to be false
        end
        it "Returns true when status == 'Landed'" do
          subject.status = "Landed"
          expect(subject.landed?).to be true
        end
        it "Returns false when status == 'Flying'" do
          subject.status = "Flying"
          expect(subject.landed?).to be false
        end
      end

      describe "#flying?" do
        it {is_expected.to respond_to(:flying?)}
        it "Returns true when flying" do
          expect(subject.flying?).to be true
        end
        it "Returns false when not flying" do
          subject.change_status
          expect(subject.flying?).to be false
        end
        it "Returns false when status == 'Landed'" do
          subject.status = "Landed"
          expect(subject.flying?).to be false
        end
        it "Returns true when status == 'Flying'" do
          subject.status = "Flying"
          expect(subject.flying?).to be true
        end
      end

      describe "#change_status" do
          it {is_expected.to respond_to(:change_status)}

          it "Will change the plane's status from 'Flying' to 'Landed'." do
            expect {subject.change_status}.to change {plane.status}.to("Landed")
          end
      end
    end
  end
end
