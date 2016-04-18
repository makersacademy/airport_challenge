require 'airport'

	
  	describe Airport do 
	let(:airplane){double :airplane, :flying? => false, :take_off => true}
	let(:flying_airplane){double :airplane, :flying? => true, :take_off => true, :land => true}
	let(:nice_weather){double :weather, :clear? => true}
	let(:bad_weather){double :weather, :clear? => false}

  		it "has a container when initialized" do
  			expect(subject.apron).to eq []
	  	end	

	  	it "has a default capacity" do
	  		expect(subject.capacity).to eq 20
	  	end	

	  	it "can be initialized with a different capacity" do
	  		airport = Airport.new(10)
	  		expect(airport.capacity).to eq 10
	  	end	

	  	it "tells an airplane to land" do
	  		subject.land(flying_airplane, nice_weather)
	  		expect(subject.apron[0]).to eq(flying_airplane)
	  	end

	  	it "tells an airplane to fly" do
	  		subject.land(flying_airplane, nice_weather)
	  		subject.fly(nice_weather)
	  		expect(subject.apron.length).to eq 0
	  	end

	  	it "informs if the lot is full" do
	  		Airport::DEFAULT_CAPACITY.times do 
	  			subject.land(flying_airplane, nice_weather)
			end 
	  		expect(subject.full?).to eq true
	  	end

	  	it "denies permission to fly if weather is not good" do
	  		subject.land(flying_airplane, nice_weather)
	  		subject.fly(bad_weather)
	  		expect(subject.apron.length).to eq 1
	  	end

	  	it "denies permission to land if weather is not good" do
	  		subject.land(flying_airplane, nice_weather)
	  		subject.fly(bad_weather)
	  		expect(subject.apron.length).to eq 1
	  	end

  end