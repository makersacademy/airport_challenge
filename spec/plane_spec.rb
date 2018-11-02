require 'plane'

describe Plane do
  # possibly redundant, created to increase test coveregae for lib/plane.rb
  it 'checks if the plane is in the air once initialized' do
    expect(subject.position).to eq "air"
  end
end
