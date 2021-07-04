require 'airport'

describe Airport do

  let(:plane) { double :plane }

  describe "#land" do
    it 'lands plane at airport' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it 'expects plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq []
    end
  end

  describe "#left_airport?" do
    it 'confirms plane has left the airport' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.left_airport?).to eq true
    end
  end

end
