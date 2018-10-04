require './Weather.rb'

describe Weather do
  it 'exists' do
    expect(Weather.new).not_to eq nil
  end
end