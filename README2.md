## Approach to solving the airport challenge

These are the steps that I used to complete the challenge.

First, an Airport class was created to satisfy the first three user stories.
Upon initialization, the weather and airport capacity was set, and default conditions are supplied if none are provided by the user.
The Airport class decided whether a plane can land and take off, depending on the current state of the plane. It also gets the request from the plane, checks the capacity and prevailing weather conditions, and allows and communicates the request made by the plane to change its current state. However, it is up to the plane to check weather it is making a valid request.
At this point the Plane class was created, and is initialized with a state and a methods to decide on which state it would like to change to, if any, send the request to the airport, and get permission from the airport to change its state.
A Weather class was created in order to use doubles and stubs in the tests for random weather assignment.
