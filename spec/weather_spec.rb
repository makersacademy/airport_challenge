require 'weather'

describe Weather do
  it 'Says the is good' do
    # Seed rand so that rand(10) will not eq 3
    srand(2)
    expect(subject.good_weather?).to eq true
  end

  it 'Says the weather is bad' do
    srand(20)
    expect(subject.good_weather?).to eq false
  end
end
