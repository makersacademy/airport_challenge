require 'weather'

class DummyWeather; include Weather; end

describe DummyWeather do

  it { is_expected.to respond_to :stormy? }

  it 'should be randomly stormy' do
    expect([true, false]).to include subject.stormy?
  end

end
