require 'plane'

describe Plane do
  it 'lands' do
    subject.land
    expect(subject.landed).to be true
  end

  it 'departs' do
    subject.depart
    expect(subject.landed).to be false
  end
  
end
