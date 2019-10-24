require 'weather'
describe Weather do
  it 'produces a random weather' do
    expect(subject.condition).to be_an(String)
  end
end
