require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument}

  it { is_expected.to respond_to(:take_off).with(1).argument}

  it 'can see a landed plane' do
    plane1 = Plane.new
    subject.land(plane1)
    expect(subject.plane).to eq plane1
  end

  it 'should raise an error when airport is full do' do
    20.times { subject.land(Plane.new) }
    expect {subject.land(Plane.new)}.to raise_error 'Airport is full'
  end

end
