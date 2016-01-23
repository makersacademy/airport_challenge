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

  context "Flying and Landing"

      describe "#landed?" do
        it {is_expected.to respond_to(:landed?)}

      describe "#flying?" do
        it {is_expected.to respond_to(:flying?)}
      end

      describe "#change_status" do
        let(:viola_plane) {xx}

          it {is_expected.to respond_to(:change_status)}

          it "Will change the plane's status from 'Flying' to 'Landed'." do
            expect {subject.change_status}.to change {plane.status}.to("Landed")
          end

          before do
            allow(airport).to receive(:land).with(viola_plane)
            airport.land(viola_plane)
          end

          it "Returns true when we check the plane is #landed? after we have landed" do
            expect(viola_plane.landed?).to be true
          end

          it "Will change the plane's status to 'Landed' when you land the plane at the airport." do
            expect(viola_plane.status).to be "Landed"
          end

      end
    end
  end

end
