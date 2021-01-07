class SurveyParser
	attr_accessor :file_path

	RANK_TO_POINTS = {
		1 => 5,
		2 => 3,
		3 => 2,
		4 => 1,
		5 => 0
	}

	def initialize(args)
		@file_path = args
	end

	def run
		result = ranked_flavors
		puts result
		result
	end

	private

	def file_data
		raw_file_data = file_path.first
		@file_data ||= File.readlines(raw_file_data)
	end

	def surveys_with_ranks
		file_data_arrays = file_data.map{|x| x.split(" ")}
		grouped_data_arrays = file_data_arrays.map{|x| [x[0..-2], x[-1]]}
		grouped_data_arrays.map{|x| [x[0].join(" "), x[-1].to_i]}
	end

	# full flavor name with converted point value, nested
	def surveys_with_points
		surveys_with_ranks.each do |x|
			points = RANK_TO_POINTS[x.last]
			x.pop
			x.push(points)
		end
	end

	# hash of flavor to totaled points
	def totaled_points
		totaled_points = Hash.new(0)
		surveys_with_points.each do |x|
			totaled_points[x.first] += x.last
		end
		totaled_points
	end
	
	def ranked_flavors
		sorted_array = totaled_points.sort_by{|k,v| [-v, k.length]}
		sorted_array.each.with_index do |x,i|
			sorted_array[i].last == sorted_array[i-1].last ? x.unshift(i) : x.unshift(i+1)
		end		
		result = sorted_array.map{|x|"#{x[0]}. #{x[1]}, #{x[-1]} pts "}.join("\n")
		puts result
		result
	end

end

if $PROGRAM_NAME == __FILE__
  SurveyParser.new(ARGV).run
end
