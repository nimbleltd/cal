require_relative './ruby_cal'

month = ARGV[0]
year = ARGV[1]


# unless month and year
# 	raise ArgumentError
# end

# unless month.to_i > 0 and year.to_i > 0
# 	raise ArgumentError
# end

if ARGV.size == 1
	year = ARGV[0]
	month = "empty"
	calendar = MakeCal.new month, year
	puts calendar.deliver_whole_year
else
	calendar = MakeCal.new month, year
	puts calendar.deliver_whole_month
end