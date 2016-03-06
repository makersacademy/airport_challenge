require 'weather'

describe Weather do

  it 'tells you whether it\'s stormy' do
    expect(Weather::stormy?).to satisfy do |value|
      [true, false].include? value
    end
  end

end
