require 'weather.rb'

describe Weather do
  subject(:condition) { described_class.new }

  it 'should equal stormy if random_weather is greater than 7' do
    subject.stub(:random_weather).and_return(true)
    expect(condition.stormy).to eq true
  end
end
