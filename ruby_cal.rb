class MakeCal
  attr_accessor :month
  attr_accessor :year

  def total_spaces_in_header
    total_spaces_in_header = @total_spaces_in_header = 20
  end

  def all_months
    all_months = @all_months = %w[March April May June July August September October November December January February]
  end

  def all_weekdays
    all_weekdays = @all_weekdays = %w[Su Mo Tu We Th Fr Sa]
  end

  def initialize(month, year)
    #raise ArgumentError,"Invalid, month must be between 1-12"  #unless (1..12).include? month
    # raise ArgumentError,"Invalid, years must be between 1800 and 3000"  unless (1800..3000).include? year
    @month  = month.to_i
    @year  = year.to_i
  end

#====================================================

  def return_header
    header = "#{how_many_spaces_do_I_need}#{what_month_is_it_longName} #{@year}"
  end

  def what_month_is_it_longName
    # print "@month = #{@month}."
    if @month > 2 and @month < 10
      month_long_name = all_months[(@month -3)]
    elsif @month == 1
      month_long_name = all_months[10]
    elsif @month == 2
      month_long_name = all_months[11]
    end
  end

# 20 spaces are available to center the month and year on
  def how_many_spaces_do_I_need
    total_chars_in_header = (what_month_is_it_longName.size + @year.to_s.size.to_i + 1)
    # print "\n @month = #{what_month_is_it_longName.size}, @year.to_s.size.to_i = #{@year.to_s.size.to_i}"
    # print "\n total_chars_in_header = #{total_chars_in_header}"
    spaces_before_month_name = ((20 - total_chars_in_header)/2)
    # print "\n spaces_before_month_name = #{spaces_before_month_name}."
    i = 1
    spacenum = ""
    while i <= spaces_before_month_name
      spacenum = spacenum + " "
      i += 1
    end
    return spacenum
  end

  def top_two_lines
    "#{return_header}\n#{all_weekdays.join(" ")}\n"
  end

  # def print_numbered_days

  # end


# Formula to determine the first day of the month
#================================================
# h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ...)
# q is the day of the month
# m is the month (3 = March, 4 = April, 5 = May, ..., 14 = February)
# K the year of the century ().
# J is the century (actually ) (For example, in 1995 the century would be 19, even though it was the 20th century.)
  def first_day_of_the_month
    day_of_month = 1
    month = @month
    year = @year
    #convert month and year
    month = (month += 9) % 12
    year -= month / 10
    #1st day of the month
    (day_of_month + ((month + 1) * 26 / 10) + year + (year / 4) + 6 * (year / 100) + (year / 400)) % 7
  end

  def number_of_days_in_the_month
    thirty_days = [4,6,9,11]
    thirty_one_days = [1,3,5,7,8,10,12]
    # define total_days
    if thirty_days.include? @month
      total_days= 30
    elsif thirty_one_days.include? @month
      total_days = 31
    else
      if (year % 4 != 0) or ((year % 100 == 0) and (year % 400 != 0))
        total_days = 28
      else
        total_days = 29
      end
    end
  end

  def print_all_the_days_of_the_month
    #print "\nnumber_of_days_in_the_month = #{number_of_days_in_the_month}"
    #create week_01
    #gap_num = (20 - (first_day_of_the_month * 2))
    gap_num = (20 - (first_day_of_the_month * 3))
    # print "\ngap_num = #{gap_num}"
    # print "\nfirst_day_of_the_month = #{first_day_of_the_month}"
    space_count = (gap_num)
    i = (first_day_of_the_month * 3)+1
    padding = ""
    while i > 0
      padding = padding + " "
      i = i-1
    end
    # print "\n|#{padding}|"
    number_of_days_in_first_week = (7-first_day_of_the_month)
    # print "\nnumber_of_days_in_first_week = #{number_of_days_in_first_week}"
    # week_01 = "#{space_count} "
    day_counter = number_of_days_in_first_week
    days_num = 1
    week_01 = "#{padding}"
    while day_counter > 0
      week_01 = "#{week_01}#{days_num}  "
      day_counter = day_counter - 1
      days_num = days_num + 1
    end

    #create week_02
    first_num_second_week = number_of_days_in_first_week + 1
    last_num_second_week = first_num_second_week + 6
    week_02_array = (first_num_second_week..last_num_second_week).to_a
    #
    #Find where 10 is
    number_of_single_digits = (10 - first_num_second_week) - 1 # - 1 is to delete first num from array
    week_02_first_digit = first_num_second_week
    week_02_single_digits = week_02_array[1..number_of_single_digits].join('  ')
    first_tens_digit = number_of_single_digits + 1
    # print "\nfirst_tens_digit = #{first_tens_digit}, number_of_single_digits = #{number_of_single_digits}"
    if first_tens_digit >= 10
      week_02_tens_digits = week_02_array[first_tens_digit..7].join(' ')
    end
    if week_02_tens_digits == ""
      week_02 = " #{week_02_first_digit}  #{week_02_single_digits}"
    else
      week_02 = " #{week_02_first_digit}  #{week_02_single_digits} #{week_02_tens_digits}"
    end

    #create week_03
    first_num_third_week = last_num_second_week + 1
    last_num_third_week = first_num_third_week + 6
    week_03_array = (first_num_third_week..last_num_third_week).to_a
    #
    #Find where 10 is
    number_of_week_03_single_digits = (10 - first_num_third_week) - 1 # - 1 is to delete first num from array
    print "\nfirst_num_third_week = #{first_num_third_week}"
    print "\nnumber_of_week_03_single_digits = #{number_of_week_03_single_digits}"
    week_03_first_digit = first_num_third_week
    first_week_03_tens_digit = number_of_week_03_single_digits + 1
    if number_of_week_03_single_digits == 0
      week_03_tens_digits = week_03_array[first_week_03_tens_digit..7].join(' ')
    else
      week_03_single_digits = week_03_array[1..number_of_week_03_single_digits].join('  ')
    end

    # print "\nfirst_tens_digit = #{first_tens_digit}, number_of_single_digits = #{number_of_single_digits}"
    if first_tens_digit >= 10
      week_03_tens_digits = week_03_array[first_tens_digit..7].join(' ')
    end
    print "\nweek_03_single_digits = |#{week_03_single_digits}|\n"
    if week_03_tens_digits == ""
      week_03 = " #{week_03_first_digit} #{week_03_single_digits}"
    elsif week_03_single_digits == nil
      week_03 = " #{week_03_first_digit} #{week_03_tens_digits}"
    else
      week_03 = " #{week_03_first_digit}  #{week_03_single_digits} #{week_03_tens_digits}"
    end



    #create week_04
    first_num_fourth_week = last_num_third_week + 1
    last_num_fourth_week = first_num_fourth_week + 6
    if number_of_days_in_the_month < last_num_fourth_week
      last_num_fourth_week = number_of_days_in_the_month
    end
    week_04_array = (first_num_fourth_week..last_num_fourth_week).to_a
    week_04 = week_04_array.join(' ')

    #create week_05
    first_num_fifth_week = last_num_fourth_week + 1
    if first_num_fifth_week < number_of_days_in_the_month
      last_num_fifth_week = first_num_fifth_week + 6
      if number_of_days_in_the_month < last_num_fifth_week
        last_num_fifth_week = number_of_days_in_the_month
      end
      week_05_array = (first_num_fifth_week..last_num_fifth_week).to_a
      week_05 = week_05_array.join(' ')
    end

    #create week_06
    first_num_sixth_week = last_num_fifth_week + 1
    if first_num_sixth_week <= number_of_days_in_the_month
      if first_num_sixth_week < number_of_days_in_the_month
        last_num_sixth_week = first_num_sixth_week + 6
        if number_of_days_in_the_month < last_num_sixth_week
          last_num_sixth_week = number_of_days_in_the_month
        end
        week_06_array = (first_num_sixth_week..last_num_sixth_week).to_a
        week_06 = week_06_array.join(' ')
      end
    end

    if first_num_sixth_week <= number_of_days_in_the_month
      all_weeks = "#{week_01.chop!.chop!}\n#{week_02}\n#{week_03}\n#{week_04}\n#{week_05}\n#{week_06}"
    else
      all_weeks = "#{week_01.chop!.chop!}\n#{week_02}\n#{week_03}\n#{week_04}\n#{week_05}"
    end
    # week_01.chop!.chop!, week_02, week_03, week_04, week_05
    return all_weeks
  end

  def deliver_whole_month
    header_with_days = "#{top_two_lines}#{print_all_the_days_of_the_month}\n\n"
  end

end