require 'weather'

describe Weather do
  it 'responds to the method #forecast' do
    expect(subject).to respond_to(:forecast)
  end
end

describe "#forecast" do
  it 'generates a weather forecast' do
  expect(Weather.new.forecast).to eq("stormy")
end
end