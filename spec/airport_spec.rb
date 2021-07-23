require 'airport'

describe Airport do

  it 'plane lands at airport' do
    expect(subject).to respond_to(:land)
  end 
  
  it 'plane takes_off from airport' do
    expect(subject).to respond_to(:take_off)
  end
  
  
end
