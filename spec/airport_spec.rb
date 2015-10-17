require 'airport'

describe Airport do
  let(:plane) {double :plane}

  it 'instruct a plane to land' do
    expect(subject).to respond_to(:land_plane)
  end

  it 'instruct a plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'raise an error if airport is full' do
    expect{subject.land_plane(plane)}.to raise_error("The airport is full")
  end

  it 'cannot land or take off if the weather is stormy' do
    expect(subject.stormy).to eq true
  end
end
