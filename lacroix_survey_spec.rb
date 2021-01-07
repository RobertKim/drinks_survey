require 'rspec'
require 'pry'

require_relative './lacroix_survey.rb'

RSpec.describe SurveyParser do
  describe '#run' do
	  context 'original sample input (2-way tie)' do
	  	let(:arguments) { ["sample-input.txt"] }
			let(:parser) { SurveyParser.new(arguments) }

		  it "rankings accurately reflect a two-way tie" do
		    expect(parser.run).to eq(
		    	"1. Banana Cabana, 10 pts \n2. Grape Escape, 8 pts \n3. Guava Java, 7 pts \n3. Star Fruit Salute, 7 pts \n5. Blackberry Fairy, 1 pts "
		    )
  		end
  	end

	  context 'sample input 3-way tie' do
	  	let(:arguments) { ["sample-input-3-way-tie.txt"] }
	  	let(:parser) { SurveyParser.new(arguments) }
	  	
	  	it "rankings accurately reflect a three-way tie" do
		    expect(parser.run).to eq(
		    	"1. Blackberry Fairy, 11 pts \n2. Grape Escape, 7 pts \n3. Guava Java, 5 pts \n3. Banana Cabana, 5 pts \n3. Star Fruit Salute, 5 pts "
		    )
  		end
	  end

	  context 'sample input 4-way tie' do
	  	let(:arguments) { ["sample-input-4-way-tie.txt"] }
	  	let(:parser) { SurveyParser.new(arguments) }
	  	
	  	it "rankings accurately reflect a four-way tie" do
		    expect(parser.run).to eq(
		    	"1. Grape Escape, 7 pts \n1. Banana Cabana, 7 pts \n1. Blackberry Fairy, 7 pts \n1. Star Fruit Salute, 7 pts \n5. Guava Java, 3 pts "
		    )
  		end
	  end

	  context 'sample input without ties' do
	  	let(:arguments) { ["sample-input-no-ties.txt"] }
	  	let(:parser) { SurveyParser.new(arguments) }
	  	
	  	it "rankings accurately reflect 5 unique placings" do
		    expect(parser.run).to eq(
		    	"1. Banana Cabana, 10 pts \n2. Grape Escape, 8 pts \n3. Guava Java, 7 pts \n4. Star Fruit Salute, 5 pts \n5. Blackberry Fairy, 3 pts "
		    )
  		end
	  end
	end 
end