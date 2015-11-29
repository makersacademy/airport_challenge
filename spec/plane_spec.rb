require 'plane'

describe Plane do
  it 'can tell whether it has #landed' do
    expect(subject).to respond_to(:landed)
  end
end
