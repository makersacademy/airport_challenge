require 'weather'

describe Weather do
  it 'can have either stormy or fair weather' do
    expect(subject.weather).to eq("stormy").or eq("fair")
  end

  it 'has can be asked if it is stormy and return a boolean' do
    expect(subject.stormy?).to eq(true).or eq(false)
  end
end
