require 'airport'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:terminal) }
  it { is_expected.to respond_to(:take_off) }

  describe '#land' do
    it 'raise error if unable to land' do
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error 'cannot land'
    end
    it 'land plane safely' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.terminal).to include plane
    end
  end

  describe '#take_off' do
    it 'raise error if cannot take_off' do
      expect { subject.take_off }.to raise_error 'cannot take off'
    end
  end
end
