require 'airport'

describe Airport do

  it 'should have a default capacity of 20' do
  expect(subject.instance_variable_get(:@capacity)).to eq 20
  end

  it 'should be able to modify the default capacity' do
    airport = Airport.new(10)
    expect(airport.instance_variable_get(:@capacity)).to eq 10
  end

  it {is_expected.to respond_to :random_weather}

  it 'lands multiple planes' do
    plane, plane1 = Plane.new
    subject.stub(:random_weather).and_return(0.5)
    subject.landing(plane1)
    subject.landing(plane)
    expect(subject.instance_variable_get(:@ground)).to eq [plane1, plane]
  end

  it 'take off multiple planes' do
    plane1, plane = Plane.new
    plane = Plane.new
    subject.stub(:random_weather).and_return(0.5)
    subject.landing(plane1)
    subject.landing(plane)
    subject.take_off
    subject.take_off
    expect(subject.instance_variable_get(:@sky)).to eq [plane, plane1]
  end

  it 'generates weather condition when taking off/landing' do
    subject.stub(:random_weather).and_return(0.5)
    subject.take_off
    expect(subject.instance_variable_get(:@weather)).to eq 0.5
  end


  it 'prevents landing when the weather is stormy' do
    subject.stub(:random_weather).and_return(0.01)
    expect {subject.landing(Plane.new)}.to raise_error "Cannot land due to stormy weather"
  end

  it 'prevents take_off when the weather is stormy' do
    subject.stub(:random_weather).and_return(0.01)
    expect {subject.take_off}.to raise_error "Cannot take off due to stormy weather"
  end

  it 'raises error when capacity is reached' do
    subject.stub(:random_weather).and_return(0.5)
    Airport::DEFAULT_CAPACITY.times {subject.landing Plane.new}
    expect {subject.landing(Plane.new)}.to raise_error "Capacity reached"
  end

end
