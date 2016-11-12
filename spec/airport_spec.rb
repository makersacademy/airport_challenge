require 'airport'

describe Airport do

  let(:plane) { double :plane }

  it {is_expected.to respond_to :land}

  it 'allows a plane to land' do
    expect(subject.land(plane)).to include(plane)
  end

end
