require 'airport'
require 'weather'

describe Airport do

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'logs one plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.hangar).to include plane
    end

    it 'logs a second plane has landed' do
      plane = Plane.new
      plane2 = Plane.new
      subject.land(plane)
      subject.land(plane2)
      expect(subject.hangar).to include plane2

    end

  end

  describe '#take_off' do

    it { is_expected.to respond_to :take_off }

    it 'confirms a plane is no longer in the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject).to receive(:stormy?).and_return(false)
      subject.take_off
      expect(subject.hangar).not_to include plane
    end

    it 'does not take off if weather is stormy' do
      plane = Plane.new
      subject.land(plane)
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error('Cannot depart due to stormy weather')
    end

  end

  describe '#stormy?' do

    it { is_expected.to respond_to :stormy? }

    it "can return true or false" do
      expect(subject.stormy?).to eq(true).or eq(false)
    end

  end

end
