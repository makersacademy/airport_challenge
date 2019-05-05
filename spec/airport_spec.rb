require 'airport'
require 'plane'

describe Airport do
  it 'lands a plane' do
    expect(subject).to respond_to(:land)
  end

  it 'instructs a plane to take-off' do
    expect(subject).to respond_to(:take_off)
  end
end
