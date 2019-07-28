require 'airport'
describe Airport do
  it 'planes can land at airport' do
    expect(subject).to respond_to :land
  end

  it 'planes can take off from airport' do
    expect(subject).to respond_to :take_off
  end

  it 'when a plane takes off there should be one less plane in the airport' do
    subject.land
    subject.take_off
    expect(subject.planes).to eq(0)
  end

  it 'there should be a method to set the weather at the airport' do
    expect(subject).to respond_to :weather
  end

  it 'A plane should not take off if weather is stormy' do
    subject.weather("stormy")
    expect{subject.take_off}.to raise_error("cannot take off while weather is stormy")
  end

  it 'A plane should not land when weather is stormy' do
    subject.weather("stormy")
    expect{subject.land}.to raise_error("cannot land while weather is stormy")
  end

  it 'when a plane tries to land in a full airport' do
    10.times{subject.land}
    expect{subject.land}.to raise_error("cannot land while airport is full")
  end

  it 'when setting the capacity of an airport' do
    heathrow = Airport.new(30)
    30.times{heathrow.land}
    expect{heathrow.land}.to raise_error("cannot land while airport is full")
  end
end