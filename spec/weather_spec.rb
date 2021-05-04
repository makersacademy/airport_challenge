require 'weather'

describe Weather do

  it { is_expected.to respond_to :random_weather }

  it 'random weather can be sunny' do
    allow{subject.random_nember_method}.to eq {5}
    subject.random_weather
    expect(subject.status).to eq "sunny"
  end

  it 'random weather can be stormy' do
    allow{subject.random_nember_method}.to eq {1}
    subject.random_weather
    expect(subject.status).to eq "stormy"
  end

end 
