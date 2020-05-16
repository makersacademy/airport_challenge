require 'airport'

describe Airport do

  it '#lands a plane' do 
    plane1 = Plane.new
    expect(subject.land(plane1)).to eq(plane1)
  end

  it ' #take_off a plane' do 
    plane = Plane.new
    expect(subject.take_off(plane)).to eq(plane)
  end

  it 'responds to #full?' do 
    expect(subject).to respond_to(:full?)
  end
end
