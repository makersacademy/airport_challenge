require 'weather'

describe Weather do

  it { is_expected.to respond_to(:generate_weather) }

  it 'generate weather that is either sunny or stormy' do
    expect(subject.generate_weather).to eq('sunny').or eq('stormy')
  end

end