require 'airport'

describe Airport do

  it 'has a weather attribute that can be set to stormy' do
    subject.weather = 'stormy'
    expect(subject.weather).to eq 'stormy'
  end

describe '#initialize' do
  it 'a new airport contains an empty array of planes' do
    airport = Airport.new
    expect(airport.planes).to be_empty
  end
end

end
