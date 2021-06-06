require 'plane'

describe Plane do

  it 'can show the plane is on the ground' do
    expect(subject.flying?).to eq false
  end
  
  it 'can show that the plane is flying' do
    expect(subject.flying?(true)).to eq true
  end

  it 'can update current location' do
    expect(subject.current_location("flying")).to eq "flying"
  end

end