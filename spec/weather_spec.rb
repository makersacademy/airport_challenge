require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it 'is expected to sometimes be stormy' do
    weather.stormy? until weather.stormy? == true
    expect(weather).to have_attributes( :stormy => true)
  end

  it 'is expected to sometimes not be stormy' do
    weather.stormy? until weather.stormy? == nil
    expect(weather).to have_attributes( :stormy => nil)
  end

end
