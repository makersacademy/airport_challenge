require 'plane'

describe Plane do

  it 'is actually a real Plane' do
    expect { Plane.new }.to_not raise_error
  end



end
