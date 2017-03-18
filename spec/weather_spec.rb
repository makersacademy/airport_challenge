require 'weather'

describe Weather do

  it 'should be stormy or sunny' do
    weathers = ['sunny', 'stormy']
    expect(weathers).to include(Weather::Weather)
  end

end
