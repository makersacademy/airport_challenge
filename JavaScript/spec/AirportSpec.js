describe("Airport", () => {
    describe("constructor", () => {
        it("responds to planes", () => {
            var airport = new Airport()
            expect(airport.planes).toBeDefined();
       }) 
    })
    
})