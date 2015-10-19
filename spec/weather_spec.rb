require 'weather'
describe Weather do

  it 'should report stormy weather' do
  expect(subject).to respond_to :stormy?
  end
end