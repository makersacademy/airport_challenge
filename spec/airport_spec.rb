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
      50.times do tf << subject.stormy? end
      expect { tf.to include?(true) }
    end

  end

  describe '#hangar' do

    it 'should return an Array' do
      expect(subject.hangar).to be_an_instance_of(Array)
    end

  end

end

describe Airplane do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'expects the argument to be an instance of Airport' do
      expect { subject(:land).(instance_of(Airport)) }
    end

  end

end
