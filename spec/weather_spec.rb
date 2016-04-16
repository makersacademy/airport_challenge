require 'weather'

describe Weather do

  it {is_expected.to respond_to :stormy?}

  it "reports a non-stormy day" do
    subject.good_weather
    expect(subject.stormy?).to eq false
  end

  it "reports a stormy day" do
    subject.bad_weather
    expect(subject.stormy?).to eq true
  end
  
end
