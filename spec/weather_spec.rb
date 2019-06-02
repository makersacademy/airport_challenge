require './lib/weather.rb'

describe Weather do

  it 'should test for stormy weather' do
    expect(subject).to respond_to(:stormy)
  end

end
