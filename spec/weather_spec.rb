require 'weather.rb'

describe Weather do
  it 'checks that a Weather object exists' do
    expect(subject).to be_instance_of Weather
  end
end
