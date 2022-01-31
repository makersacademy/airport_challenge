require 'plane'

describe Plane do
  
  it 'should be able to create an instance of itself and we should be able to check its colour' do 
    expect(subject.colour).to eq "white"
  end

end
