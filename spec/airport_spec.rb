require 'airport'

describe Airport do
  it 'gets a random weather on initalization' do
    expect(subject.weather == "sunny" || subject.weather == "stormy").to eq(true)
  end
end
