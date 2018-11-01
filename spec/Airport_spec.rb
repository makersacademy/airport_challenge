require 'Airport'

describe Airport do
  it 'Plane to land at an airport' do
    expect(subject).to respond_to :land
  end
end
