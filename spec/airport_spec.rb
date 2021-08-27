require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to be_kind_of(Airport)}
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it 'should receive a landing plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end

  it 'should instruct plane to take off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject).to eq(subject)
  end
end
