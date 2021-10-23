require 'plane'

describe Plane do

  it 'instructs plane to land at airport' do
    expect(subject).to respond_to(:land)
  end

end