require_relative '../lib/airport'

describe Weather do
  let(:subject) { Weather.new }

  it { is_expected.to respond_to :check_conditions }

  it 'should return sunny more often than stormy' do
    arr = []
    50.times { arr.push(subject.check_conditions) }
    expect(arr.count("sunny") > arr.count("stormy")).to eq true
  end

end