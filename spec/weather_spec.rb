require 'weather'

describe Weather do 
    it 'should be an instance of weather' do
        expect(subject).to be_an_instance_of(Weather)
    end

    it 'should have a stormy value' do 
        expect(subject.stormy?).to be false
end