require 'plane'

describe Plane do
  let(:plane) { subject }
  let(:flying) { subject }

  it 'Plane flying on initialization' do
    expect(subject).to eq flying
  end

  it { should respond_to(:take_off) } 
  it 'Plane in-flight' do
    subject.take_off
    expect(subject.flying).to eq true
  end  
  
  it { should respond_to(:land) } 
  it 'Plane has landed' do
    subject.land
    expect(subject.land).to eq !flying
  end  

  

end

 