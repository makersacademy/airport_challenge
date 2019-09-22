require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  
  it 'creates a new plane' do
    expect(plane).to eq plane  
  end
end
