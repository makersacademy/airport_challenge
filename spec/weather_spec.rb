require 'weather'

describe Weather do
  it 'will return a boolean value' do
    expect(Weather.stormy?).to satisfy{|x| (x == true) || (x == false)} 
  end
end
