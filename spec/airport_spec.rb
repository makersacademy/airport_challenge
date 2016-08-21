require 'airport'

describe Airport do

  it {is_expected.to respond_to :stormy}

  it 'lands multiple planes' do
    plane = Plane.new
    plane1 = Plane.new
    subject.landing(plane1)
    expect(subject.landing(plane)).to eq [plane1, plane]
  end

  it 'take off multiple planes' do
    plane = Plane.new
    plane1 = Plane.new
    subject.take_off(plane1)
    expect(subject.take_off(plane)).to eq [plane1, plane]
  end

  it 'the airport becomes stormy' do
    subject.stormy
    expect(subject.instance_variable_get(:@weather)).to eq false
  end

end
