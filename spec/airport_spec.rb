require 'airport'

describe Airport do

  describe '#stormy?' do

    it { is_expected.to respond_to(:stormy?) }

    it 'is expected to have a value of true or false' do
      expect(subject.stormy?).to be(true).or be(false)

      # expect(variable).to be_in([true, false])
    end

    it 'should sometimes be true, sometimes false' do
      tf = []
      50.times { tf << subject.stormy? }
      expect(tf).to include(true, false)
    end

  end

  describe '#hangar' do

    it 'should return an Array' do
      expect(subject.hangar).to be_an_instance_of(Array)
    end

  end

end

describe Airplane do

  it { is_expected.to respond_to(:land).with(1).arguments }
  it { is_expected.to respond_to(:take_off) }

  describe '#land' do

    it 'raises an error if the wether is stormy' do
      expect { subject.land(Airport.new) }.to raise_error "Too stormy!"
    end

    it 'Airport arg should exist' do
      # expect((subject.land("any")) with(instance_of(Airport)))
      # expect { subject(:land).with(instance_of(Airport)) }
      # expect land(with(instance_of(Airport)))
      # expect(land).instance_of(Airport)
    end

  end

  describe 'take_off' do


  end

end
