## Completed Coding Challenge for Substantial, accompanying Robert Kim's Application to Wilson Sonsini.

This submission contains my solution to Substantial's coding challenge for the Lecroix flavor ranking survey.

### Language

My language of choice was Ruby (ruby 2.7.2p137)

### Instructions

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

I can be reached via email at robertjoonkim@gmail.com with any question/feedback.  Thank you for the opportunity.  