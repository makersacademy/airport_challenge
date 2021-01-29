require 'airport.rb'

  describe 'Airport' do
    describe 'land' do
    it 'the airport will send a message to the plane to land when it is not stormy' do
      srand(2)
      airport = Airport.new
      airport.weather
      airport.max_capacity(5)
      airport.land("345")
      expect(airport.planes).to eq ["345"]
    end
    it 'the airport will not allow a plane to land if it is stormy' do
      srand(1)
      airport = Airport.new
      airport.weather
      airport.max_capacity(5)
      airport.weather
      airport.land("345")
      expect(airport.land("345")).to eq("you can not land due to stormy weather")
      expect(airport.planes).to eq []
    end
  end
  describe 'take off' do
    it 'the airport will instruct a plane to take off as long as the weather is not stormy' do
      srand(2)
      airport = Airport.new
      airport.max_capacity(5)
      airport.weather
      airport.planes << "345"
      airport.planes << "360"
      airport.take_off("345")
      expect(airport.planes).to eq ["360"]
    end
    it 'I want to stop planes from taking off if the weather is stormy.' do
      srand(1)
      airport = Airport.new
      airport.weather
      airport.max_capacity(6)
      airport.planes << "345"
      airport.planes << "567"
      airport.planes << "777"
      airport.take_off("777")
       expect(airport.take_off("777")).to eq("you can not take off due to bad weather")
       expect(airport.planes).to eq ["345", "567", "777"]
      end
  end
  describe 'max capacity' do
    it 'when the airport is full, by reaching max capacity, the airport will tell the plane not to land' do
       srand(2)
       airport = Airport.new
       airport.weather
       airport.max_capacity(5)
       airport.land("345")
       airport.land("360")
       airport.land("368")
       airport.land("777")
       airport.land("698")
       expect(airport.land("355")).to eq("the airport is full")
     end
   end
    describe 'override max capacity' do
      it 'so the programme can be used at other airports, I want to override the max capacity' do
         airport = Airport.new
         airport.max_capacity(6)
         expect(airport.capacity).to eq(6)
         airport.max_capacity(20)
         expect(airport.capacity).to eq(20)
      end
     end
   end
