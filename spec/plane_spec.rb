require 'plane'

describe Plane do

  it 'tells you plane is flying after takeoff' do
    subject.takeoff
    expect(subject.flying?).to eq(true)
  end
  
  it 'tells you plane isn\'t flying after landing' do
    subject.land
    expect(subject.flying?).to eq(false)
  end
end
