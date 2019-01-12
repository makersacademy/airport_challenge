require 'weather'

RSpec.describe Weather do
  it { should respond_to :forecast }

  it 'should randomly return weather as stormy or safe' do
    expect(Weather.current).to eq 'stormy' or eq 'safe'
  end
end
