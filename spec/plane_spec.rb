require 'plane'

describe Plane do
  it 'repsonds to #landed?' do
    expect(subject).to respond_to :landed?
  end
end
