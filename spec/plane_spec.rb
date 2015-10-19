require 'plane'

describe Plane do

  it 'should not take off or be in an airport if flying' do
    heathrow = Airport.new
    allow(heathrow.weather).to receive(:stormy?).and_return(false)
    subject.fly
    heathrow.land(subject)
    allow(subject).to receive(:flying).and_return(true)
    expect {heathrow.take_off(subject)}.to raise_error 'Plane is already flying'
  end

  it 'cannot land at an airport if it is not flying' do
    heathrow = Airport.new
    allow(heathrow.weather).to receive(:stormy?).and_return(false)
    allow(subject).to receive(:flying).and_return(false)
    expect{heathrow.land(subject)}.to raise_error 'Plane is not flying'
  end

  it 'is no longer in the airport after taking off' do
    allow(subject).to receive(:flying).and_return(true, false)
    heathrow = Airport.new
    allow(heathrow.weather).to receive(:stormy?).and_return(false)
    heathrow.land(subject)
    heathrow.take_off(subject)
    expect(heathrow.planes).not_to include(subject)
  end

end
