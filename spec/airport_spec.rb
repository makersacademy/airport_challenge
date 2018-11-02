require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  describe '#hangar' do

    it { expect(subject).to respond_to(:hangar) }

  end

  describe '#takeoff' do

    it 'can make a plane in its hangar take off' do
      allow(plane).to receive(:landed=).with(false)
      subject.hangar << plane
      subject.takeoff(plane)
      expect(subject.hangar).to eq([])
    end

    it "cannot make a plane that isn't in its hangar take off" do
      expect { subject.takeoff(plane) }.to raise_error 'Plane not at this airport'
    end

  end

end
