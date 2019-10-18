require 'weather'

describe Weather do 
    it 'should be an instance of weather' do
        expect(subject).to be_an_instance_of(Weather)
    end

    it 'should have a stormy value' do 
        expect(subject.stormy).to be false
    end

    it 'should randomly pick if the weather is stormy' do
        subject.set_weather

        expect(subject.stormy).to eq true | false
    end
end