require './lib/weather'

describe Weather do
  it 'returns true or false when passed #stormy?' do
    expect{(subject.stormy?).to be(true).or be(false)}
  end
end 
