require './lib/weather.rb'

describe Weather do

  it 'should test for stromy weather' do
    expect(subject).to respond_to(:stormy)
  end

end
