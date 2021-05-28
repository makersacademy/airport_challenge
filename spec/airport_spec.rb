require 'airport'

describe Airport do
  let(:plane) { subject }
  it { should respond_to(:full?) }
  it 'default number of planes set to 5' do
  expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  it 'default can be overridden'
  end
end