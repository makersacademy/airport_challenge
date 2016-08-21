require 'airport'

describe Airport do

  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:landing).with(1).argument}
  it {is_expected.to respond_to :stormy}

  it 'lands multiple planes' do
    plane = Plane.new
    plane1 = Plane.new
    subject.landing(plane1)
    expect(subject.landing(plane)).to eq [plane1, plane]
  end

  it 'take off a plane' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq [plane]
  end

  it 'the airport becomes stormy' do
    subject.stormy
    expect(subject.instance_variable_get(:@weather)).to eq false
  end

end
