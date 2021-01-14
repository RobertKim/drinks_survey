## Code Sample accompanying Robert Kim's Application to ToMarket

Here is my solution to a coding challenge requiring proper scoring of a drink flavor ranking survey.

### Language

My language of choice was Ruby (ruby 2.7.2p137)

## The Problem

A special event to taste and rate new soda flavors, asked attendees to rank the new flavors from most to least favorite.

### Input/Output

The input is plain text. My solution should fetch and parse the data from `sample-input.txt`.

The input contains results from three attendees. Each line has the flavor and the rank from 1 to 5. See `sample-input.txt` for details. The output was designed to be ordered from most to least preferred, _exactly matching_ the contents of `expected-output.txt`.

The input will always be well-formed, and thus no need to add special handling for malformed input files.

### The Rules

5 points should be given to an attendee's favorite flavor, 3 points to their second favorite, 2 points to their third favorite, 1 point to their fourth favorite and 0 points to their fifth favorite.

If two flavors are ranked equally then they are assigned the same rank, having the drink with the shorter name listed first.

### Solution Instructions

To run the application from the command line, use the `ruby` command along with the name of the file containing the code and script, followed by an argument of the name for the provided sample data:

```
ruby lacroix_survey.rb sample-input.txt
```

Additional sample data was created for testing edge cases surrounding proper ranking of tie scenarios in flavor point totals.  The file names of these alternate samples indicate the specific tie situations that were tested.  For example:

```
ruby lacroix_survey.rb sample-input-2-way-tie.txt
```

In addition, a file was created to test a no-tie scenario:

```
ruby lacroix_survey.rb sample-input-no-ties.txt
```

### Testing

Automated tests are contained in the file `lacroix_survey_spec.rb`, written with RSpec.  The command used to run these tests from the command line is as follows:

```
rspec lacroix_survey_spec.rb --format=documentation
```

I can be reached via email at robertjoonkim@gmail.com with any questions/feedback.  Thank you for the opportunity.  
