require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to(respond_to(:land).with(1).argument) }
  it { is_expected.to(respond_to(:flying?).with(1).argument) }
  it { is_expected.to(respond_to(:planes))}
  it { is_expected.to(respond_to(:take_off)) }

  describe '#planes' do
    it 'returns landed planes' do
      allow(plane).to(receive(:landed?))
      allow(plane).to(receive(:land_plane))
      subject.land(plane)
      expect(subject.planes).to(eq([plane]))
    end
  end

  describe '#land' do
    it 'returns an error if the plane is already landed' do
      allow(plane).to(receive(:landed?).and_return(true))
      expect{ subject.land(plane) }.to(raise_error("Plane has already landed"))
    end
    it 'lands a plane' do
      allow(plane).to(receive(:landed?).and_return(false))
      expect(plane).to(receive(:land_plane))
      subject.land(plane)
    end
  end

  describe '#take_off' do
    it 'returns an error if there are no landed planes' do
      expect{subject.take_off}.to(raise_error("No planes"))
    end
    it 'tells a plane to take off' do
      allow(plane).to(receive(:landed?))
      allow(plane).to(receive(:land_plane))
      subject.land(plane)
      expect(plane).to(receive(:fly))
      subject.take_off
    end
    it 'removes the plane from the planes array' do
      allow(plane).to(receive(:landed?))
      allow(plane).to(receive(:land_plane))
      allow(plane).to(receive(:fly))
      subject.land(plane)
      subject.take_off
      expect(subject.planes).to(be_empty)
    end
  end

  describe '#flying?' do
    it 'returns the landed? status of the plane' do
      expect(plane).to(receive(:landed?))
      subject.flying?(plane)
    end
  end

end
