require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double :plane }

  describe "#land" do
    it 'raises an error when the aiport is full' do
      plane = double(:plane)
      10.times {subject.land(plane)}
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end
  end

  context 'the weather is fine' do

    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
    end

    xit 'confirms the plane has taken off and is not in the airport' do
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'recieves a plane when one lands' do
      expect(subject.land(plane)).to eq [plane]
    end
  end

  context 'the weather is too stormy for take off' do

    before do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    end

    xit 'does not allow a plane to take off if it is stormy' do
      plane = double(:plane)
      subject.land(plane)
      expect {subject.takeoff(plane)}.to raise_error 'It is too stormy to take off'
    end
  end
end
