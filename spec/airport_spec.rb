require 'airport'
#require 'weather'

describe Airport do
  let(:plane) {double(:plane)}

  it "instructs a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "confirms the plane is in the airport" do
    allow(plane).to receive(:land)
    subject.land(plane)
    expect(subject.in_airport).to include(plane)
  end

  it "instructs a plane to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "confirms the plane is airborne" do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.take_off(plane)
    expect(subject.in_air).to include(plane)
  end

    context 'when stormy' do

      # xit "checks wether the given weather is stormy" do
      #   expect(subject.stormy?).to respond_to(:weather)
      # end
      it "won't allow plane to take off if weather is stormy" do
        allow(subject).to receive(:stormy?).and_return(true)
        expect{subject.take_off(plane)}.to raise_error("It isn't safe to fly.")
      end
    end
end
