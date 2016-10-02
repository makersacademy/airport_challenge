require 'airport'

DEFAULT_CAPACITY = 50

describe Airport do

  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :take_off}

#describe 'plane landed' do
#  it 'instructs plane to land' do
#    subject.land(plane)
#    expect(subject.plane).to eq @planes
#  end

#  end

end
