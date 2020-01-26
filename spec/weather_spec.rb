require 'weather'

describe Weather do
  it 'responds to stormy with true or false' do
    expect((Weather.new).stormy?).to eq(true).or eq(false)
  end
end