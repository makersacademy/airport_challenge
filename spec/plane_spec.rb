require 'plane'
require 'airport'

describe Plane do

  
  it 'starts in the air' do
    expect(subject).to be_airbourne
  end
      
  it 'can land' do
    is_expected.to respond_to (:land)
  end

  it 'is not airbourne when landed' do
    subject.land
    expect(subject).not_to be_airbourne
  end

  it 'can takeoff' do
    is_expected.to respond_to (:take_off)
  end

  it 'is airbourne after take off' do
    subject.land
    subject.take_off
    expect(subject).to be_airbourne
  end
end
 
