require 'weather'

describe Weather do
  it "returns stormy when random number is 8 or 9" do
    expect(subject).to receive(:rand).and_return(8)
    expect(Weather.generate_weather).to eq "stormy"  
  end
end
