require 'weather'

describe Weather do

  it 'should be a number less than 10' do
    expect(Weather::Determiner).to be <= 10
  end

  it 'should be stormy or sunny' do
    weathers = ['sunny', 'stormy']
    expect(weathers).to include(Weather::Weather)
  end

end
