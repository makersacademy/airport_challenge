require 'plane'

describe Plane do

  it 'should be reported flying when takeoff called' do
    subject.takeoff
    expect(subject.takeoff).to eq true
  end

  it 'should be reported landed when land called' do
    subject.land
    expect(subject.flying).to eq false
  end

end
