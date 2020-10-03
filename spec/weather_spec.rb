require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it { is_expected.to be_an_instance_of Weather }

  it "can be stormy or sunny" do
    expect(weather.options).to include(:stormy)
    expect(weather.options).to include(:sunny)
  end
end