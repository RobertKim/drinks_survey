require 'rspec'
require 'pry'

require_relative './lacroix_survey.rb'

RSpec.describe SurveyParser do
  describe '#run' do
	  context 'with sample input provided' do
	  	let(:arguments) { ["sample-input.txt"] }
			let(:parser) { SurveyParser.new(arguments) }

		  it "outputs the points for each drink in the survey results" do
		    expect(parser.run).to eq(
		    	"1. Banana Cabana, 10 pts \n2. Grape Escape, 8 pts \n3. Guava Java, 7 pts \n3. Star Fruit Salute, 7 pts \n5. Blackberry Fairy, 1 pts "
		    )
  		end
  	end
  end
end