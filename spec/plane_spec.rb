require 'plane'

describe Plane do
  it 'returns true if flying? method exists' do
    expect(Plane.new.respond_to?('flying?')).to eq true
  end
end
