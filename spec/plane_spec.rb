require 'plane'

describe Plane do
  it 'checks if flying' do
    expect(subject.flying).to eq true
  end

  it 'allows flying to be changed' do
    flying = false
    plane = Plane.new(false)
    expect(plane.flying).to eq(flying)
  end
end
