
I plan to do my best to make very little baby steps while working on this project.
I plan to follow the steps we used to complete challenges during the week.
I will write very detailed explanation of what I do, mainly for myself. When I feel more comfartable, explanation probably will become less detailed.

Started to work on the first piece of the user story. 

1. First I organised the nouns and verbs into Objects and Messages

 |Objects 			|Messages						|Comments		|
 |	----			|			----				|		----	|
 |Pilot				|								|				|
 |Destination 		|								|(same as airoport?)|
 |Plane				|land - appropriate airport		|not sure about use of appropriate airoport yet|	
 |Airport 			|								|					|
 
 Conclusion - probably will start to work from Plane class.
 
2. Out of interest I run rspec on existing tests. Received very interesting result that all tests were skipped, read about pending examples.

3. I read existing tests for Plane class.

 xit 'is flying when created' - seems to be to early for this test.
 
 As I understand from the Task and the contest ot the user story, a plane can be either flying or landed. So the plane should respond to flying? first.
 
 This is my starting point. 
 
4. First test.

 4.1. Feature test in irb
 
 ```
 :001 > plane = Plane.new
 => #<Plane:0x007f919a0e72d8> 
 :002 > plane.flying?
 NoMethodError: undefined method `flying?' for #<Plane:0x007f919a0e72d8>
	from (irb):2
	from /Users/yana/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
 :003 > 
 ```

 Does not respond to flying? yet.
 
 4.2. Wrote the test, made it fail. 
 
 4.3 Wrote empty method flying? in Plane. Now the test pass. A plane responds to flying?

 4.4. Commited the changes, pushed them to github

 4.5. Had some problems with Markdown in README, added it to README, commited, pushed, now it looks nicer.

5. Now I think it is time for the test xit 'is flying when created'

 5.1. Feature test in irb

 ```
 :001 > plane = Plane.new
  => #<Plane:0x007fb0e98ffe20> 
 :002 > plane.flying?
  => nil 
 :003 > 
 ```

 Expected true, got nil.

 5.2. Wrote the test, made it fail.

 5.3. Now I have several options to write a code.

 First, I can just make flying? always return true, it will make the test pass (I checked!).
 Second, I can write something more complicated involving writing method initialize and introducing new variable @status = true, and make flying? return status. Probably there are other better options. At this stage decided to take the first approach and see what happens next.

 Now the test passed.

 5.4. Commited, pushed.

6. Now back to the first piece of the user story. Time to teach the plane to land.
 
 6.1. Feature test in irb

 ```
 :001 > plane = Plane.new
  => #<Plane:0x007fb982002920> 
 :002 > plane.land
 NoMethodError: undefined method `land' for #<Plane:0x007fb982002920>
	from (irb):2
	from /Users/yana/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
 :003 > 
 ```
 Does not land yet.

 6.2. Wrote the test, made it fail

 6.3. Wrote an empty method land in Plane, now the test pass.

 6.4. Commited, pushed.

7. Now it is time to think about status landed? 
 
 7.1. Feature irb test

 ```
 :001 > plane = Plane.new
  => #<Plane:0x007fb2b398b940> 
 :002 > plane landed?
 NoMethodError: undefined method `landed?' for main:Object
	from (irb):2
	from /Users/yana/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
 :003 > 
 ```
 7.2. Wrote the test, made it fail

 7.3. Wrote empty method landed? in Plane. Now the test pass.

 7.4. As a refactoring stage had a thought that may be methods should be not #flying? and #landed?, but one method #status returning 'flying' or 'landed'. Decided to stick to the logic of boris_bikes for now.

 7.5. Commited, pushed.

8. Plane should be landed after landing. It also means that plane should not be landed before landing (otherwise we can not be sure that #land actually landed the plane, may be it was olready landed). I do not know if it is possible to check status of a subject before calling particular method (it seems strange). So I need another way to check that a plane is not landed before landing. Decided to start from the fact that a new plane is flying (so was not landed), new plane should not be landed.
 
 8.1. Feature test in irb

 ```
 :001 > plane = Plane.new
  => #<Plane:0x007faff28c6938> 
 :002 > plane.landed?
  => nil 
 :003 >
 ```
 Expected to be false, got nil.

 8.2. Wrote the test, made it fail.

 8.3. Connected landed with flying (when landed not flying). Test pass.

 8.4. Commited, pushed.

9. Now it makes more sense to check that plane is landed after landing.

 9.1. Feature test in irb

 ```
 :001 > plane = Plane.new
  => #<Plane:0x007fe4ba9a00f0> 
 :002 > plane.landed?
  => false 
 :003 > plane.land
  => nil 
 :004 > plane.landed?
  => false 
 :005 > 
 ```
 Expected to get true, got false

 9.2. Wrote the test, made it fail.

 9.3. Wrote some code, made the test pass. At a refactor stage thought about introducing attr_accessor to get rid of @, decided not to.

 9.4. Commited, pushed.

10. I think that main requirements from the first piece of the user story are covered now, except for an appropriate airport. Returnd to point 1, thought about "a diagram that shows how your Objects will use Messages to communicate with one another". Still not sure about appropriate airport (argument for landed? but what for? Return of landed? Again, what for?). Decided to move to the second piece of the user story and come back to the issue with an appropriate airport later.

Started to work on the second piece of the user story.

1. Make a plane to be able to take off from an appropriate airport

 1.1. Feature test in irb

 ```
 :001 > plane = Plane.new
  => #<Plane:0x007fc1cb9ba520 @flying=true> 
 :002 > plane.take_off
 NoMethodError: undefined method `take_off' for #<Plane:0x007fc1cb9ba520 @flying=true>
	from (irb):2
	from /Users/yana/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
 :003 > 
 ```

 1.2. Wrote the test, made it fail

 1.3. Wrote an empty #take_off, test passed.

 


 


	











