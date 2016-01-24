require 'weather'

describe Weather do

  it 'expects randomness' do
    tester = []
    100.times do
      tester << subject.stormy?
    end
    expect(tester).to include true
  end

end
