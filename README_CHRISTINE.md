# Airport First Weekend Challenge

I managed to finish the code for the first 4 user stories, but the tests were not able to accommodate random storms.

## Planning
- I first attempted to break down the first user story into a diagram with the messages running between the objects.

- I then reviewed the code and test from the Boris Bike challenge to see what I had done during the week.

- Once I had started the first user story I kept having to change my plan and code to accommodate the requirements of the next three user stories.



## Code

- I enjoyed developing the different user stories functionality.

- I didn't feel that any of the code which I use was particularly complex. I was able to write most of it without having to google things.

## Rspec Tests

- I found the Rsepc test the most challenging part of the whole exercise. I struggled when I had to refactor them to add each additional layer of complexity to my code for each user story

- My biggest issue was compensating for the random numbers needed to create the weather. I managed to google a reliable way to test the random number generator, but I was unable to reliably compensate for the true/ false boolean values which this then generated to indicate if there was a storm.

- I did a lot of googling but struggled as most example didn't show or explain how their suggestion for mitigating the random variables could be used with in the whole code. This lack of complete context left me very confused as to where things needed to be or how I could used them.

- I also need to be aware that when ensuring tests work without the interference of a random object, I must run the tests several times. I was caught out at times into thinking my test worked, but they then broke a few rspecs down the line. 
