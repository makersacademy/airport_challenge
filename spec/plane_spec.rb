require 'plane'

describe Plane do

  subject = Plane.new

  it 'shows flying status when created' do
  	expect(subject.flying?).to eql(true)
  end

  it 'can land' do
  	subject.has_taken_off
  	subject.landed
  	expect(subject.flying?).to eql(false)
  end

  it 'shows landed status after landing' do
  	subject.landed
  	expect(subject.flying?).to eql(false)
  end

  it 'can take off' do
  	subject.landed
  	subject.has_taken_off
  	expect(subject.flying?).to eql(true)
  end

  it 'shows flying status after take off' do
  	subject.has_taken_off
  	expect(subject.flying?).to eql(true)
  end

end
