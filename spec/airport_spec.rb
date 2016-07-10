require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it '#plane landed' do
    expect(subject.land(Plane.new)).to eq("Plane landed")
  end

  it '#take_off plane' do
    expect(subject.take_off(Plane.new)).to eq("Plane taken off")
  end

end
