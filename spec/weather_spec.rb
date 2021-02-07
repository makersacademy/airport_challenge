require 'weather'

describe Weather do
  it 'creates randomised weather' do
  expect(subject.storm?).to eq(:storm).or eq(:sun)
end

end
