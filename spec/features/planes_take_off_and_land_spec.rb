require "airport"

describe ".Airport/.Weather interaction" do

  let(:aerlingus) {:aerlingus}
  let(:ba) {:ba}
  let(:emirates) {:emirates}
  let(:condition) {Weather.new}

  stormy_weather_error = "Stormy weather! Not safe to fly."

  subject { Airport.new }

  it "takes off and lands multiple planes in varying weather conditions" do
    subject.land(:ba)
    subject.land(:aerlingus)
    expect(subject.landed?(:aerlingus)).to eq true
    subject.land(:emirates)
    expect(subject.landed?(:ba)).to eq true
    expect(subject.landed?(:emirates)).to eq true
    allow(condition).to receive(:forecast).and_return(:stormy)
    subject.weather_conditions(condition)
    expect{subject.take_off(:emirates)}.to raise_error(stormy_weather_error)
    allow(condition).to receive(:forecast).and_return(:fine)
    subject.weather_conditions(condition)
    subject.take_off(:aerlingus)
    expect(subject.landed?(:aerlingus)).to eq false
    subject.take_off(:ba)
    subject.take_off(:emirates)
  end
end
