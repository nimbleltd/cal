require_relative './ruby_cal'

month = ARGV[0]
year = ARGV[1]

calendar = MakeCal.new month, year
puts calendar.year_or_year_and_month