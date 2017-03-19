require './lib/planes.rb'

describe Planes do
  it 'Check if plane is landed when initialized' do
    expect(subject.landed).to eq true
  end

  it 'Check if plane takes off' do
    subject.take_off
    expect(subject.landed).to eq false
  end

  it 'Check if plane lands' do
    subject.take_off
    subject.land

    expect(subject.landed).to eq true
  end

  describe 'Error checking' do
    it 'Landed plane landing' do
      subject.take_off
      subject.land

      expect{subject.land}.to raise_error 'The plane has already landed'
    end

    it 'Taken off plane taking off' do
      subject.take_off
      expect{subject.take_off}.to raise_error 'The plane has already taken off'
    end
  end
end
