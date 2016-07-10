require 'airport'

describe Airport do
subject { described_class.new(20) }
  let(:plane) { double(:plane) }

  it 'does not allow landing when it is full' do
    20.times { subject.land(:plane) }
    expect { subject.land(:plane) }.to raise_error "Cannot land plane as airport is full"
  end

  describe'#land' do
#  let(:plane) { double(:plane) }

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

#    it 'confirms that a plane has landed' do
#      expect(subject.land(:plane)).to eq(:plane)
#    end

  end


# it { is_expected.to respond_to(:plane)}
# this is now taken care of in example below

  describe '#plane' do
#  subject { described_class.new(20) }
# let(:plane) { double(:plane) }

      it 'confirms what planes are in an airport' do
        expect{ subject.plane }.to eq(@planes)
      end
    end

  describe '#take_off' do
  #  subject { described_class.new }
#    let(:plane) { double(:plane) }

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

#    it 'confirms that a plane has taken off' do
#      subject.land(:plane)
#      expect(subject.take_off(:plane)).to eq(:plane)
#    end

  end
end
