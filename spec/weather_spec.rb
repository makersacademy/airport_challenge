require 'weather'

describe Weather do

  it '#stormy should return a boolean' do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

end
