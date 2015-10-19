require 'airport'


describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument}

  it { is_expected.to respond_to(:take_off).with(1).argument}



describe '#land' do
  it 'can see a landed plane' do
    plane1 = (double :plane)
    subject.land(plane1)
    expect(subject.planes).to include plane1
  end
end

describe '#take_off' do
  it 'lets a plane take off' do
    expect(subject).to respond_to(:take_off)
  end
end

  it 'should raise an error when airport is full do' do
    described_class::DEFAULT_CAPACITY.times { subject.land(double :plane) }
    expect {subject.land(double :plane)}.to raise_error 'Airport is full'
  end



end
