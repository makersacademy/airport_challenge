require 'weather'

describe 'weather' do
  let(:weather) { Weather.new }

  it 'should respond to weather class' do
    expect(weather).to be_a_kind_of(Weather)
  end

  it 'should respond to method stormy' do
    expect(weather).to respond_to(:stormy)
  end

  it 'should respond to method stormy?' do
    expect(weather).to respond_to(:stormy?)
  end

#Is the below a pointless test since it could only ever be true or false?
  it 'should choose between sunny and stormy' do
    weather.stormy
    expect(weather.stormy?).to eq(true).or eq(false)
  end

  # it 'should have gettable variable stormy' do
  #   expect(weather.stormy?).to eq(@stormy)
  # end

  #How can I test for randomness?
end
