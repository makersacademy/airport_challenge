require 'weather.rb'
describe Weather do
  it 'Prevents a takeoff if the weather is stormy' do
    expect(subject).to respond_to(:stormy1)
  end
  it 'Prevents a landing if the weather is stormy' do
    expect(subject).to respond_to(:stormy2)
  end
end
