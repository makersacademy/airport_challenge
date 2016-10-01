require 'airport'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}

  it 'instructs a plane to land at an airport' do
    expect(subject.land).to eq @plane
  end

end
