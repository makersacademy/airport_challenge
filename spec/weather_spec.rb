require 'weather'

describe Weather do
  it 'generates random weather' do
    expect(subject.generate).to eq("Sunny").or eq("Stormy")
  end
end
