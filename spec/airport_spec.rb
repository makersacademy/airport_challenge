require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to(respond_to(:land).with(1).argument) }
  it { is_expected.to(respond_to(:is_flying?).with(1).argument) }

  describe '#land' do
    it 'checks to see if the plane is flying' do
      expect(subject).to(receive(:is_flying?))
      subject.land(plane)
    end
  end

  describe '#is_flying?' do
    it 'returns the landed? status of the plane' do
      expect(plane).to(receive(:landed?))
      subject.is_flying?(plane)
    end
  end

end
