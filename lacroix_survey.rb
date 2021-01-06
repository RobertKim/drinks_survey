filename = ARGV
file = filename.first

ary = File.readlines(file).map{|x| x.split(" ")}

new_ary = ary.map{|x| [x[0..-2], x[-1]]}

ary_of_arys = new_ary.map{|x| [x[0].join(" "), x[-1].to_i]}
# [["Guava Java", 1], ["Grape Escape", 2], ["Star Fruit Salute", 3], ["Blackberry Fairy", 4], ["Banana Cabana", 5], ["Banana Cabana", 1], ["Star Fruit Salute", 2], ["Grape Escape", 3], ["Guava Java", 4], ["Blackberry Fairy", 5], ["Banana Cabana", 1], ["Grape Escape", 2], ["Star Fruit Salute", 3], ["Guava Java", 4], ["Blackberry Fairy", 5]]

# puts yo

RANK_TO_POINTS = {
	1 => 5,
	2 => 3,
	3 => 2,
	4 => 1,
	5 => 0
}

ary_of_arys.each do |x|
	points = RANK_TO_POINTS[x.last]
	x.pop
	x.push(points)
end

points_hash = Hash.new(0)
ary_of_arys.each do |x|
	points_hash[x.first] += x.last
end

ordered_points_hash = points_hash.sort_by{|k,v| [-v, k.length]}

points_ary = ordered_points_hash.to_a

# Formatting for readability
formatted_points_ary = []
points_ary.each.with_index do |x,i|
	formatted = []
	formatted << (i+1).to_s + ". " + x.first
	formatted << x.last.to_s + " pts"
	formatted_points_ary << formatted.join(", ")
end

puts formatted_points_ary.join("\n")
# p formatted_points_ary