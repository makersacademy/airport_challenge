require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to(respond_to(:land).with(1).argument) }
  it { is_expected.to(respond_to(:is_flying?).with(1).argument) }

  describe '#land' do
    it 'returns an error if the plane is already landed' do
      expect(plane).to(receive(:landed?).and_return(true))
      expect{ subject.land(plane) }.to(raise_error("Plane has already landed"))
    end
    it 'lands a plane' do
      expect(plane).to(receive(:landed?).and_return(false))
      expect(plane).to(receive(:land_plane))
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
