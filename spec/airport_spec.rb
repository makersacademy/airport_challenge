require './lib/airport.rb'
describe Airport do
  it { should respond_to(:landing) }

  it { should respond_to(:takeoff) }

  it 'it expect a plane to be gone after take off' do
    plane = subject.takeoff
    expect(plane).to be_gone
  end
  
end
