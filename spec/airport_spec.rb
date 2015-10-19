require 'airport'


describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument}

  it { is_expected.to respond_to(:take_off).with(1).argument}

  # this test only makes sense for the earlier single-plane version
  it 'can see a landed plane' do
    # should use a dummy here
    plane1 = Plane.new
    subject.land(plane1)
    # this should read: expect(subject.planes).to include plane1
    expect(subject.plane).to eq plane1
  end

  it 'should raise an error when airport is full do' do
    # use 'described_class' instead of 'Airport'
    # use dummies rather than real planes
    Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
    expect {subject.land(Plane.new)}.to raise_error 'Airport is full'
  end

  it 'should raise an error for landing if weather is stormy' do

  end

  # it 'should raise an error for taking off if weather is stormy' do
  #
  # end

end
