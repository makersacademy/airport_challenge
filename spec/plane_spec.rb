require 'plane'

describe Plane do
  it 'accepts a request to land at an airport' do
    expect(subject.land).to equal(true)
  end

  it 'sets the at_airport? indicator to true when call to land is made' do
    subject.land
    expect(subject.at_airport?).to eql(true)
  end

  it 'accepts a request to take off from the airport' do
    expect(subject.take_off).to equal(true)
  end

end