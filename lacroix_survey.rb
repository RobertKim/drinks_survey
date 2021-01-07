require 'tempfile'

class SurveyParser
	attr_accessor :in_file_path

	RANK_TO_POINTS = {
		1 => 5,
		2 => 3,
		3 => 2,
		4 => 1,
		5 => 0
	}

	def initialize(args)
		@in_file_path = args
	end

	def run
		result = formatted_points_array.join("\n")
		puts result
		result
	end

	private

	def file_data
		file_data = in_file_path.first
		@raw_file_data ||= File.readlines(file_data)
	end

	def file_data_arrays(data=file_data)
		file_data.map{|x| x.split(" ")}
	end

	# each product word with rank in array, nested
	def grouped_data_arrays
		file_data_arrays.map{|x| [x[0..-2], x[-1]]}
		
	end

	# full product name with rank, nested
	def product_with_rank_arrays
		grouped_data_arrays.map{|x| [x[0].join(" "), x[-1].to_i]}
	end

	# full product name with converted point value, nested
	def product_with_points_arrays
		product_with_rank_arrays.each do |x|
			points = RANK_TO_POINTS[x.last]
			x.pop
			x.push(points)
		end
	end

	# hash of product to totaled points
	def points_hash
		points_hash = Hash.new(0)
		product_with_points_arrays.each do |x|
			points_hash[x.first] += x.last
		end
		points_hash
	end
	
	def sorted_points_hash
		points_hash.sort_by{|k,v| [-v, k.length]}
	end

	def points_array
		sorted_points_hash.to_a
	end

	# Formatting for readability
	def formatted_points_array
		formatted_points_array = []
		points_array.each.with_index do |x,i|
			formatted_line_array = []			
			formatted_line_array << "#{(i+1)}. #{x.first}"
			formatted_line_array << "#{x.last} pts "
			formatted_points_array << formatted_line_array.join(", ")
		end	
		p formatted_points_array
		formatted_points_array
	end
	
end

if $PROGRAM_NAME == __FILE__
  SurveyParser.new(ARGV).run
end
