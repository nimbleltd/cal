require_relative './ruby_cal'

month = ARGV[0]
year = ARGV[1]

calendar = MakeCal.new month, year
puts calendar.deliver_whole_month