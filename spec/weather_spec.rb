require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  it '#get_weather returns a string describing the weather' do
    expect(subject.get_weather).to be_an_instance_of(String)
  end

end
