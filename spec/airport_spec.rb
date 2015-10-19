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

describe '#initializing capacity' do
  it 'has a #DEFAULT_CAPACITY of 20' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it 'has an overridden capacity when specified' do
      subject = Airport.new(50)
      expect(subject.capacity).to eq 50
  end
end


  it 'should raise an error when airport is full' do
    described_class::DEFAULT_CAPACITY.times { subject.land(double :plane) }
    expect {subject.land(double :plane)}.to raise_error 'Airport is full'
  end



end
