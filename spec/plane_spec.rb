require 'plane'

describe Plane do
  it 'lands at an airport' do
    expect(subject).to respond_to :land
  end
end 
