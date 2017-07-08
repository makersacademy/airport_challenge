require 'weather'

describe Weather do

  include Weather

  it 'method weather randomly returns stormy? as true or false' do
    expect(stormy?).to eq(true).or(eq(false))
  end

end
