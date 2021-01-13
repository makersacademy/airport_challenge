describe("Airport", () => {
    describe("constructor", () => {
        var airport = new Airport()
        it("responds to hangar", () => {
            expect(airport.hangar).toBeDefined();
        })
        it("hangar is empty when starts", () => {
            expect(airport.hangar).toEqual([]);
        })
        it("responds to capacity", () => {
            expect(airport.capacity).toBeDefined();
        })
        it("sets a default capacity", () => {
            expect(airport.capacity).toEqual(19);
        })
        it("responds to takeOff", () => {
            expect(airport.takeOff).toBeDefined();
        })
        it("responds to land", () => {
            expect(airport.land).toBeDefined();
        })
    })
    describe("land", () => {
        var airport = new Airport()
        it("has plane as argument", () => {
            spyOn(airport, 'land');
            airport.land('plane')
            expect(airport.land).toHaveBeenCalled();
            expect(airport.land).toHaveBeenCalledWith('plane');
        })
        it("has permition to land", () => {
            airport.land('plane')
            expect(airport.hangar).toContain("plane")
            expect(airport.hangar.length).toEqual(1)
        })
     
        it("denies permition if hangar is full", () => {
            airport.hangar.pop()
            for (var hangar = 0; hangar<= 19; hangar++) {
                airport.land("plane")
            }
            expect(airport.hangar.length).toEqual(20)
            airport.land("plane")
            console.log(airport.hangar.length)
            expect(airport.hangar.length).not.toEqual(21)
            // reset the hangar to 0
            airport.hangar.length = 0 
        })

    })
    

})