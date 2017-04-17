require 'weather'

describe Weather do
  it {is_expected.to respond_to('storm')}

  it 'can be made stormy to aviod the random weather' do
    expect(subject.conjure_storm).to be true
  end

  it 'can be made sunny to aviod the random weather' do
    expect(subject.bring_the_sun).to be false
  end

  it 'can randomly generte either the sun or a storm' do
    expect(subject.random_weather).to_not be_nil
  end

end
