require 'weather'

describe Weather do
  it "can create a new instance of the weather class" do
    expect(subject).to be_an_instance_of Weather
  end
  it "randomly generates sunny weather conditions" do
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(5)
    expect(subject.status).to eq("sunny")
  end
  it "randomly generates stormy weather conditions" do
    allow_any_instance_of(Weather).to receive(:randomizer).and_return(10)
    expect(subject.status).to eq("STORMY")
  end
end
