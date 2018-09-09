require "weather"
describe Weather do
  let(:fake_weather) { Weather.new }

  it "has a status" do
    expect(subject.status).to be_an(Integer)
  end

  
end
