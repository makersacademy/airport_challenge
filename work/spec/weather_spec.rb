require 'weather'

describe Weather do
  it 'exists!' do
    expect(subject.class).to eq Weather
  end

  it { is_expected.to respond_to(:check_weather) }

  it { is_expected.to respond_to(:weather) }
end
