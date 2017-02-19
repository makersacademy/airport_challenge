require 'airport'
#require 'weather'

describe Airport do
  let(:plane) {double(:plane)}

  describe 'landing planes' do
    it "instructs a plane to land" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "confirms the plane is in the airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.in_airport).to include(plane)
    end
  end

  describe 'take-off' do
    it "instructs a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it "confirms the plane is airborne" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.take_off(plane)
      expect(subject.in_air).to include(plane)
    end
  end

    context 'when stormy' do
      it "won't allow the plane to land when weather is stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.land(plane)}.to raise_error("It isn't safe to land.")
      end

      it "won't allow plane to take off if weather is stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("It isn't safe to fly.")
      end
    end
end
