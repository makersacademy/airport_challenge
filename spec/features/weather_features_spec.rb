require 'weather'

describe WEATHER do

  let(:dummy_class) { Class.new { include WEATHER } }
  let(:obj) { dummy_class.new }

  it 'tells whether there is .bad_weather' do
    expect(obj.bad_weather).to be ( true || false )
  end

end
