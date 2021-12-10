require 'airport'

describe Airport do
  # Test - Instruct plane to land at airport
  it 'instructs plane to land' do
    expect(subject).to respond_to(:land)
  end
  # Test - instruct a plane to takeoff
  it 'instructs plane to takeoff' do
    expect(subject).to respond_to(:take_off)
  end
end