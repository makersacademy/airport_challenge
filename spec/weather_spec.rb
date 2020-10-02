require 'Weather.rb'
describe Weather do
  it { is_expected.to respond_to :random_number }

  it 'random number generator' do
    weatheroutcome = Weather.new
    expect weatheroutcome.stub(:random_number) { 345678 } == 345678
  end

end
