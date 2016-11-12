require 'airport'

describe Airport do

  let(:plane) { double :plane }

  it {is_expected.to respond_to :land}

  it 'allows a plane to land' do
    expect(subject.land(plane)).to include(plane)
  end

  it 'allows you to see landed planes, to confirm that they have landed' do
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'allows planes to take off' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

end
