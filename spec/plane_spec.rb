require 'plane'

describe Plane do
  it 'responds to exists?' do
    expect(subject).to respond_to(:exists?)
  end
end
