require 'plane'

describe Plane do
#   it 'checks Plane class exists' do
#     expect(Plane).to be_truthy
#     end

  it 'returns true to land method' do
    expect(Plane.new.land).to be_truthy
    end
end