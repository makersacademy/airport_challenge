require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:flying) { subject }

  it 'Plane flying on initialization' do
    expect(subject).to eq flying
  end

  it 'Error when trying to land when plane in-flight' do
    expect { subject.take_off }.to raise_error 'Plane is already in-flight'
  end 
    
  it 'Plane in-flight' do
    subject.land
    expect(subject.take_off).to eq true
  end  
  
  it 'Error when trying to land when plane is already on the ground' do
    subject.land
    expect { subject.land }.to raise_error 'Plane is already on the ground'
  end  
  it 'Plane has landed' do
    expect(subject.land).to eq !flying
  end  
end
