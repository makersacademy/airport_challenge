require 'weather'

RSpec.describe Weather do 

  it ' return :sunny if n is included in (1..7) otherwise :stormy ' do
    expect(subject.status).to eq(:sunny).or eq(:stormy)
  end

end
