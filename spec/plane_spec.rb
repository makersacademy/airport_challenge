require 'plane'
require 'airport'

describe Plane do

  let (:plane) {Plane.new}

  it 'creates new planes' do
    expect(:plane).to eq(:plane)
  end


end
