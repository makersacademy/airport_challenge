require 'weather'

describe Weather do

  it{is_expected.to respond_to(:weather)}

  it 'the weather should be stormy' do
    expect(subject.weather).to eq('stormy')
  end

end
