require 'plane'

describe Plane do
  
  it 'sets the at_airport? indicator to true when call to land is made' do
    subject.land
    expect(subject.at_airport?).to eql(true)
  end

  it 'sets the at_airport? indicator to false when call to take_off is made' do
    subject.take_off
    expect(subject.at_airport?).to eql(false)
  end

end