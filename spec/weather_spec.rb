require 'weather'

describe Weather do

  it { is_expected.to be_kind_of Weather }

  it 'can be sunny or stormy' do

    expect(subject.weather).to eq('sunny').or eq('stormy')
  end

end