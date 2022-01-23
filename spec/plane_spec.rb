require 'plane'

describe Plane do

  before (:each) do
    @plane = Plane.new
  end

  it 'plane class exists' do
    
    expect(@plane.class).to eq (Plane)
  end
end
