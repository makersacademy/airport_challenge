require 'weather'

describe Weather do
  it { is_expected.to respond_to :stormy? }

  it 'is either stormy or not' do # tests that stormy on any instance of weather will be either true or false
    expect(subject.stormy?).to be(true).or be(false)
  end

end
