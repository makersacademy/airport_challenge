require 'plane'
describe Plane do

  it 'should respond to :landed' do
    expect(subject).to respond_to :landed
  end

  it 'checks plane has landed' do
    expect(subject.land).to eq true
  end

end
