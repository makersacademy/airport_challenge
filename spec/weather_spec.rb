require 'weather'

 describe Weather do

   it 'can create an instance of itself' do
     expect(subject).to be_instance_of(Weather)
   end

   it 'responds to stormy weather method' do 
     expect(subject).to respond_to(:stormy?)
   end

   it 'responds from stormy? with true when stormy' do
     allow(subject).to receive(:rand).and_return(1)
     expect(subject.stormy?).to be true
   end

 end 