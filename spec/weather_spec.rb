require 'weather'

describe Weather do

  it 'is expected to create new weather object' do
    expect(Weather.new.is_a? Weather).to eq true
  end

end
