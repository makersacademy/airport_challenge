require 'airport'

describe Airport do

  it '#plane landed' do
    expect(subject.land(Plane.new)).to eq("Plane landed")
  end

  it '#take_off plane' do
    expect(subject.take_off(Plane.new)).to eq("Plane taken off")
  end

end
