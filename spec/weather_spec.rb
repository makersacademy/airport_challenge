require 'weather'

describe Weather do
  it 'checks if weather exists' do
    expect(subject).to be_a Weather
  end

  it { is_expected.to respond_to :stormy? }

  it 'checks if weather is stormy' do
    weather = double(subject, stormy?: true)
    expect(weather.stormy?).to eq true
  end

  it 'checks if weather is sunny' do 
    weather = double(subject, stormy?: false)
    expect(weather.stormy?).to eq false
  end 
    
  it 'returns true or false' do
    expect(subject.stormy?).to be(true).or be(false)
  end

end 

#  I want to prevent landing when weather is stormy 
