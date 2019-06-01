require 'airport'

describe Airport do

  it { is_expected.to respond_to(:safe?) }

  it 'should be safe to land / takeoff if weather is sunny' do
    weather = object_double(Weather.new)
    allow(weather).to receive(:generate_weather) { 'sunny' }
    expect(subject).to be_safe
  end

end