require 'Weather'
describe Weather do
  it 'Responds to weather if it is stormy' do
    expect(subject).to respond_to(:stormy?)
  end 
end
