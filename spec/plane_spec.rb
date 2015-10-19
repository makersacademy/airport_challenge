require 'plane.rb'

describe Plane do

context 'Flying status' do

  it 'is flying when it is initialized' do
    expect(subject.flying_status).to eq true
  end

  it 'changes flying status to true when the fly method is invoked' do
    subject.fly
    expect(subject.flying_status).to eq true
  end

  it 'changes flying status to false when the dont_fly method is invoked' do
    subject.dont_fly
    expect(subject.flying_status).to eq false
  end

end
end
