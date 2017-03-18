require 'airport'

describe Airport do
  subject(:plane) { described_class.new }

  describe '#land' do
    it 'allows planes to land' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'does not allow landed planes to land again' do
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error("This plane has already landed")
    end

    it 'has the plane after landing' do
      subject.land(plane)
      expect(subject.landing_strip).to include plane
    end
  end

  describe "#take_off" do
    it 'allows planes to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'does not allow airborne planes to take off again' do
      expect{ subject.take_off(plane)}.to raise_error "This plane is already airborne"
    end

    it 'does not have the plane after take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.landing_strip).not_to include plane
    end
  end

end
