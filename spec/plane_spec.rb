require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {double :airport}

  describe "#initialize" do
    context "All planes have a status, flying or landed" do

      # it {is_expected.to respond_to(:status)}

      it "Ensures that, for Airtraffic control, Plane.new is initially flying" do
        expect(plane.status).to eq :Flying
      end

    end
  end

    context "Flying and Landing" do

      describe "#landed?" do
        # it {is_expected.to respond_to(:landed?)}

        it "Returns true when landed" do
          plane.change_status
          expect(plane.landed?).to be true
        end

        it "Returns false when not landed" do
          expect(plane.landed?). to be false
        end

        it "Returns true when status == 'Landed'" do
          plane.status = :Landed
          expect(plane.landed?).to be true
        end

        it "Returns false when status == 'Flying'" do
          plane.status = :Flying
          expect(plane.landed?).to be false
        end

      end

      describe "#flying?" do
        # it {is_expected.to respond_to(:flying?)}

        it "Returns true when flying" do
          expect(plane.flying?).to be true
        end

        it "Returns false when not flying" do
          plane.change_status
          expect(plane.flying?).to be false
        end

        it "Returns false when status == 'Landed'" do
          plane.status = :Landed
          expect(plane.flying?).to be false
        end

        it "Returns true when status == 'Flying'" do
          plane.status = :Flying
          expect(plane.flying?).to be true
        end

      end

      describe "#change_status" do

          # it {is_expected.to respond_to(:change_status)}

          it "Will change the plane's status from 'Flying' to 'Landed'." do
            expect {plane.change_status}.to change {plane.status}.to(:Landed)
          end
      end
    end
end
