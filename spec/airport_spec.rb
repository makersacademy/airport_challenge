require 'airport'
require 'weather'

describe Airport do

  context 'weather is clear' do
    before(:each) do
      @plane = Plane.new
      @plane2 = Plane.new
    end

    it 'allows plane to land and logs landing' do
      expect(subject).to receive(:stormy?).and_return(false)
      subject.land(@plane)
      expect(subject.hangar).to include @plane
    end

    it 'allows planes to land and logs second landing' do
      2.times { expect(subject).to receive(:stormy?).and_return(false) }
      subject.land(@plane)
      subject.land(@plane2)
      expect(subject.hangar).to include @plane2
    end

    it 'allows plane to take off and logs the departure' do
      subject.land(@plane)
      subject.take_off
      expect(subject.hangar).not_to include @plane
    end
  end

  context 'weather is stormy' do
    before(:each) do
      @plane = Plane.new
    end

    it 'does not allow planes to land' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(@plane) }.to raise_error('Cannot land due to stormy weather')
    end

    it 'does not take off if weather is stormy' do
      subject.land(@plane)
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error('Cannot depart due to stormy weather')
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to :take_off }
  end

  describe '#stormy?' do

    it { is_expected.to respond_to :stormy? }

    it "can return true or false" do
      expect(subject.stormy?).to eq(true).or eq(false)
    end

  end

end
