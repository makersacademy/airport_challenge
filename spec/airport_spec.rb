require 'airport'

describe Airport do

  it 'should have a default capacity of 20' do
  expect(subject.instance_variable_get(:@capacity)).to eq 20
  end

  it 'lands multiple planes' do
    plane, plane1 = Plane.new
    subject.landing(plane1)
    subject.landing(plane)
    expect(subject.instance_variable_get(:@ground)).to eq [plane1, plane]
  end

  it 'take off multiple planes' do
    plane, plane1 = Plane.new
    subject.take_off(plane1)
    subject.take_off(plane)
    expect(subject.instance_variable_get(:@sky)).to eq [plane1, plane]
  end

  it 'the airport becomes stormy' do
    subject.stormy
    expect(subject.instance_variable_get(:@weather)).to eq false
  end

  it 'raises error when capacity is reached' do
    Airport::DEFAULT_CAPACITY.times {subject.landing Plane.new}
    expect {subject.landing(Plane.new)}.to raise_error "Capacity reached"
  end

end
