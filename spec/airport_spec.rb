require 'airport'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:terminal) }

  describe '#land' do
    it 'raise error if unable to land' do
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error(RuntimeError)
    end
  end
end
