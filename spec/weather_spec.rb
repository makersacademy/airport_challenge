require 'weather'

describe Weather do

  include Weather

  it 'method weather randomly returns sunny or stormy' do
    expect(weather).to eq(:stormy).or(eq(:sunny))
  end

end
