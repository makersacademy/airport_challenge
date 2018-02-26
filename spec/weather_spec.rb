require './lib/weather'

describe Weather do
  before(:each) do
    @weather = Weather.new
  end
  it { should respond_to(:storm?) }
  it 'should return a random condition of the weather' do
  expect(subject.storm?).to be(false).or be(true)
  end
end
