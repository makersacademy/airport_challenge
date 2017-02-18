require 'plane'

describe Plane do

  it 'land?' do
    expect(subject).to respond_to(:land?)
  end

  it 'take_off?' do
    expect(subject).to respond_to(:take_off?)
  end

end
