require 'plane'

describe Plane do

  it 'should not take off or be in an airport if flying' do
    a = Airport.new
    allow(a.weather).to receive(:stormy?).and_return(false)
    subject.fly
    a.land(subject)
    expect {a.take_off(subject)}.to raise_error 'Plane is already flying'
  end

  it 'cannot land at an airport if it is not flying' do
    a = Airport.new
    allow(a.weather).to receive(:stormy?).and_return(false)
    allow(subject).to receive(:flying).and_return(false)
    expect{a.land(subject)}.to raise_error 'Plane is not flying'
  end

end
