require 'plane'

describe Plane do
  before do 
    @spitfire = Plane.new
    @hurricane = Plane.new
    @hurricane.landed
  end

  it 'is able to check if a plane is airborne' do
    expect(@spitfire).to respond_to :airborne?
    expect(@spitfire.airborne?).to eq true
    expect(@hurricane.airborne?).to eq false
  end
  
  it 'is able to see if a plane can be landed' do
    expect(@spitfire).to respond_to :landed
    @spitfire.landed
    expect(@spitfire.airborne?).to eq false
  end
  
  it 'is able to see if a plane can be taken off and flying' do
    expect(@spitfire).to respond_to :flying
    @hurricane.flying
    expect(@hurricane.airborne?).to eq true
  end
end
