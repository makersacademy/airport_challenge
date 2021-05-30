require 'plane'

describe Plane do
  let(:plane) { subject }
  let(:flying) { subject }

  it 'Plane flying on initialization' do
    expect(subject).to eq flying
  end

  it { should respond_to(:take_off) }
  it 'Error if trying to land when plane in-flight' do
    expect{subject.take_off}.to raise_error 'Plane is already in-flight'
  end 
    
  it 'Plane in-flight' do
    subject.take_off
    expect(subject.plane).to flying == true
  end  
  
  it { should respond_to(:land) }
  it 'Error if trying to land when plane is on the ground' do
    expect{subject.land}.to raise_error 'Plane is already on the ground'
  end  
  it 'Plane has landed' do
    subject.land
    expect(subject.land).to eq !flying
  end  

end

 