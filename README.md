Brief: We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Approach: I mapped out the user cases to show what the input, method and output was for each one. I then went through each of those one by one to write them in test form and then to write the required code to pass the tests. Once they passed I attempted any refactoring and ran rspec again to ensure it still passed. I believe I have satisfied the first 4 user cases of the challenge. I've spent a couple of hours attempting to pass the last 2 which are both related to the random weather method but I have struggled with those. I know how to generate a random number and assign it to a weather type but I'm yet to find out how I can implement that into my code to satisfy the related tests as well as ensuring the other tests continue to pass.

Update: With a bit of help from the YouTube video on the challenge I have now been able to get my code and tests to work to account for stormy weather. I didn't know how to use stubs previously.
