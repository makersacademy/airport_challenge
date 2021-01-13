describe("Airport", () => {
    describe("constructor", () => {
        it("responds to hangar", () => {
            var airport = new Airport()
            expect(airport.hangar).toBeDefined();
        }) 
        it("hangar is empty when starts", () => {
            var airport = new Airport()
            expect(airport.hangar).toEqual([]);
        })
    })
    
})