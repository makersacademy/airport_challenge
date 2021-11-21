require 'weather'

describe Weather do
  
  it 'should be able to create a weather instance and check the weather status' do
  subject.generate_weather
  expect(subject.status).to eq("stormy").or eq("sunny")
  end









end