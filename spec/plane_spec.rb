require 'plane'

describe Plane do
  it 'accepts instruction to land' do
    expect(subject).to respond_to(:land)
  end
end
