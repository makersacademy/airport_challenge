require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  it { should respond_to(:stormy?) }

  it 'should expect stormy? to be true or false' do
    weather = Weather.new
    weather = weather.stormy?
    expect([true, false].include? weather).to eq true
  end

end
