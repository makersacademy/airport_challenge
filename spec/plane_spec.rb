require 'Plane'

describe Plane do

  it 'landing changes status' do
    subject.land
    expect(subject.status).to eq false
  end

  it 'take off changes status' do
    subject.take_off
    expect(subject.status).to eq true
  end

end
