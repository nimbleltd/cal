require 'pry'
class MakeCal
  attr_accessor :month
  attr_accessor :year
  attr_accessor :number_of_days_in_first_week
  attr_accessor :number_of_days_in_second_week
  attr_accessor :number_of_days_in_third_week
  attr_accessor :number_of_days_in_fourth_week
  attr_accessor :number_of_days_in_fifth_week
  attr_accessor :year_only

  def total_spaces_in_header
    total_spaces_in_header = @total_spaces_in_header = 20
  end

  def all_months
    all_months = @all_months = %w[March April May June July August September October November December January February]
  end

  def whole_year_months
    whole_year_months = @whole_year_months = %w[January February March April May June July August September October November December]
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

  def return_whole_year_header
    header = "#{how_many_spaces_do_I_need}#{what_month_is_it_longName}#{how_many_spaces_do_I_need}"
  end

  def what_month_is_it_longName
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
    total_chars_in_header = (what_month_is_it_longName.size + 5)
    spaces_before_month_name = ((20 - total_chars_in_header)/2)
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
def get_month_list get_first_day_index = false
    month_list = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    month_list = month_list.rotate!(2) if get_first_day_index
    month_list
  end # get_month_list method

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
    # puts @month
    year = @year
    #convert month and year
    # month = ((month + 9) % 12)+3
    # puts month
    # month = 7
    # year = year - (month / 10)
    if month == 1 or month == 2
      month = month + 12
      year = year -1
    end
    #1st day of the month
    (((month + 1) * 26 / 10).floor + year + (year / 4).floor + 6 * (year / 100).floor + (year / 400).floor) % 7
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

  # def last_day_of_the_month
  #   Date.civil(@year, @month, -1).day
  # end

  def generate_week01
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
    @number_of_days_in_first_week = (7-first_day_of_the_month)
    # print "\nnumber_of_days_in_first_week = #{number_of_days_in_first_week}"
    # week_01 = "#{space_count} "
    day_counter = @number_of_days_in_first_week
    days_num = 1
    week_01 = "#{padding}"
    while day_counter > 0
      week_01 = "#{week_01}#{days_num}"
      day_counter = day_counter - 1
      days_num = days_num + 1
    end
    week_01_array = (1..number_of_days_in_first_week).to_a
    week_01_joined = week_01_array[0..number_of_days_in_first_week].join('  ')
    week_01 = "#{padding}#{week_01_joined}"
    return week_01
  end

  def generate_week02
    count_the_days_in_week01 = generate_week01.split().size
    # print "\ncount_the_days_in_week01 = #{count_the_days_in_week01}"
    # print "\n@number_of_days_in_first_week = #{@number_of_days_in_first_week}"
    first_num_second_week = @number_of_days_in_first_week + 1
    last_num_second_week = first_num_second_week + 6
    # print "\nfirst_num_second_week = #{first_num_second_week} and \nlast_num_second_week = #{last_num_second_week}"
    week_02_array = (first_num_second_week..last_num_second_week).to_a
    #
    #Find where 10 is
    number_of_single_digits = (10 - first_num_second_week) - 1 # - 1 is to delete first num from array
    week_02_first_digit = first_num_second_week
    week_02_single_digits = week_02_array[1..number_of_single_digits].join('  ')
    if last_num_second_week >= 10
      first_tens_digit = number_of_single_digits + 1
      week_02_tens_digits = week_02_array[first_tens_digit..7].join(' ')
    end
    if week_02_tens_digits == ""
      week_02 = " #{week_02_first_digit}  #{week_02_single_digits}"
    else
      week_02 = " #{week_02_first_digit}  #{week_02_single_digits} #{week_02_tens_digits}"
    end
    return week_02.rstrip
  end

  def generate_week03
    last_day_in_week02 = generate_week02.split()[-1]
    # print "\ncount_the_days_in_week02 = #{last_day_in_week02}"
    # print "\n@number_of_days_in_second_week = #{last_day_in_week02}"
    first_num_third_week = last_day_in_week02.to_i + 1
    last_num_third_week = first_num_third_week + 6
    # print "\nfirst_num_third_week = #{first_num_third_week} and \nlast_num_third_week = #{last_num_third_week}"
    week_03_array = (first_num_third_week..last_num_third_week).to_a
    #
    #Find where 10 is
    number_of_single_week03_digits = (10 - first_num_third_week) - 1 # - 1 is to delete first num from array
    if first_num_third_week < 10
      week_03_first_digit = first_num_third_week
      week_03_single_digits = week_03_array[1..number_of_single_week03_digits].join('  ')
    else
      week_03_first_digit = first_num_third_week
      first_tens_digit_week03 = first_num_third_week
      # print "\nfirst_tens_digit_week03 = #{first_tens_digit_week03}"
      week_03_tens_digits = week_03_array[1..7].join(' ')
    end
    if first_num_third_week < 10 and last_num_third_week >= 10
      first_tens_digit_week03 = number_of_single_week03_digits + 1
      week_03_tens_digits = week_03_array[first_tens_digit_week03..7].join(' ')
    end
    if week_03_tens_digits == ""
      week_03 = " #{week_03_first_digit}  #{week_03_single_digits}"
    elsif week_03_single_digits == nil
      week_03 = "#{week_03_first_digit} #{week_03_tens_digits}"
    elsif week_03_first_digit == 9
      week_03 = " #{week_03_first_digit} #{week_03_tens_digits}"
    else
      week_03 = " #{week_03_first_digit}  #{week_03_single_digits} #{week_03_tens_digits}"
    end
    return week_03.rstrip
  end

  def generate_week04
    last_day_in_week03 = generate_week03.split()[-1]
    # print "\ncount_the_days_in_week03 = #{last_day_in_week03}"
    # print "\n@number_of_days_in_third_week = #{last_day_in_week03}"
    first_num_fourth_week = last_day_in_week03.to_i + 1
    last_num_fourth_week = first_num_fourth_week + 6
    # print "\nfirst_num_fourth_week = #{first_num_fourth_week} and \nlast_num_fourth_week = #{last_num_fourth_week}"
    week_04_array = (first_num_fourth_week..last_num_fourth_week).to_a
    #
    #Find where 10 is
    number_of_single_week04_digits = (10 - first_num_fourth_week) - 1 # - 1 is to delete first num from array
    if first_num_fourth_week < 10
      week_04_first_digit = first_num_fourth_week
      week_04_single_digits = week_04_array[1..number_of_single_week04_digits].join('  ')
    else
      week_04_first_digit = first_num_fourth_week
      first_tens_digit_week04 = first_num_fourth_week
      # print "\nfirst_tens_digit_week04 = #{first_tens_digit_week04}"
      week_04_tens_digits = week_04_array[1..7].join(' ')
    end
    if first_num_fourth_week < 10 and last_num_fourth_week >= 10
      first_tens_digit_week04 = number_of_single_week04_digits + 1
      week_04_tens_digits = week_04_array[first_tens_digit_week04..7].join(' ')
    end
    if week_04_tens_digits == ""
      week_04 = " #{week_04_first_digit}  #{week_04_single_digits}"
    elsif week_04_single_digits == nil
      week_04 = "#{week_04_first_digit} #{week_04_tens_digits}"
    elsif week_04_first_digit == 9
      week_04 = " #{week_04_first_digit} #{week_04_tens_digits}"
    else
      week_04 = " #{week_04_first_digit}  #{week_04_single_digits} #{week_04_tens_digits}"
    end
    return week_04.rstrip
  end

  def generate_week05
    last_day_in_week04 = generate_week04.split()[-1]
    # print "\nlast_day_in_week04 = #{last_day_in_week04}"
    first_num_fifth_week = last_day_in_week04.to_i + 1
    # print "\nfirst_num_fifth_week = #{first_num_fifth_week}"
    if first_num_fifth_week < number_of_days_in_the_month
      last_num_fifth_week = first_num_fifth_week + 6
      if number_of_days_in_the_month < last_num_fifth_week
        last_num_fifth_week = number_of_days_in_the_month
      end
      week_05_array = (first_num_fifth_week..last_num_fifth_week).to_a
      week_05 = week_05_array.join(' ')
    else
      " " * 20
    end
  end

  def generate_week06
    # print "\n#{generate_week05.split()[-1]} == #{number_of_days_in_the_month}"
    if generate_week05.split()[-1].to_i == number_of_days_in_the_month.to_i
      return 0 #"                    "
    elsif !generate_week05.split()[-1].nil? && generate_week05.split()[-1] != number_of_days_in_the_month
      last_day_in_week05 = generate_week05.split()[-1]
      # print "\nlast_day_in_week05 = #{last_day_in_week05}"
      first_num_sixth_week = last_day_in_week05.to_i + 1
      # print "\nfirst_num_fifth_week = #{first_num_sixth_week}"
      last_num_sixth_week = number_of_days_in_the_month
      if first_num_sixth_week == number_of_days_in_the_month
        week_06_array = [first_num_sixth_week]
      else
        week_06_array = (first_num_sixth_week..number_of_days_in_the_month).to_a
        week_06 = week_06_array.join(' ')
      end
      if week_06_array.size == 1
         mike = week_06_array[0].to_s.split()
         week_06 = "#{mike[0]}#{mike[1]}"
      end
    else
      week_06 = " " * 20
    end
    week_06
  end

  def deliver_whole_month
    # print "\ngenerate_week06 = #{generate_week06}"
    if generate_week06 == 0
    header_with_days = "#{top_two_lines}#{generate_week01}\n#{generate_week02}\n#{generate_week03}\n#{generate_week04}\n#{generate_week05}\n\n"
    else
    header_with_days = "#{top_two_lines}#{generate_week01}\n#{generate_week02}\n#{generate_week03}\n#{generate_week04}\n#{generate_week05}\n#{generate_week06}\n"
    end
  end

  def deliver_whole_year
    whole_year = "                             #{year}\n\n"
    days_header = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
    month_header_01_of_03 = "      January               February               March\n"
    month_header_04_of_06 = "       April                  May                   June\n"
    month_header_07_of_09 = "        July                 August              September\n"
    month_header_10_of_12 = "      October               November              December\n"
    # q = 1
    # while q < 7
    #
    row_nums_1to3 = ""
    1.upto(4) do |week|
      1.upto(3) do |month|
        mike = MakeCal.new month, @year
        row_nums_1to3 << mike.send("generate_week0#{week}".to_sym)
        row_nums_1to3 << "  " unless month == 3
      end
      row_nums_1to3 << "\n"
    end

      i = 1
      row05_nums = ""
      while i < 4
        mike = MakeCal.new i, @year
        bill = mike.generate_week05.size
        if bill < 20
          padding = " " * (20 - bill)
          row05_nums << mike.generate_week05 << padding << "  "
          i += 1
        elsif bill == 20
          row05_nums << mike.generate_week05 << "  "
          i += 1
        else
          row05_nums << mike.generate_week05 << "  "
          i += 1
        end
      end
      row05_nums << "\n"
      # binding.pry

      i = 1
      row06_nums = ""
      while i < 4
        mike = MakeCal.new i, @year
        bill = mike.generate_week06.to_s.size
        if bill < 20 and bill > 1
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
          # binding.pry
        i += 1
        row06_nums << mike.generate_week06 << padding #<< "a  "
        elsif bill == 1
          if mike.generate_week06 != 0
            print "\nmike.generate_week06 = #{mike.generate_week06}"
            row06_nums << mike.generate_week06 << "                    " << "  "
            i += 1
          elsif mike.generate_week06 == 0
            row06_nums << "                    " << "  "
            i += 1
          end
        else
          row06_nums << mike.generate_week06 << "  "
          i += 1
        end
      end
      if row06_nums.rstrip == ""
          row06_nums = "                                            "
      end
      if i == 4 and mike.generate_week06 != 0
        row06_nums = row06_nums.rstrip
      end
      row06_nums << "\n"

      # 4-6 #####################
      ###########################

    row_nums_7to10 = ""
    1.upto(4) do |week|
      4.upto(6) do |month|
        mike = MakeCal.new month, @year
        row_nums_7to10 << mike.send("generate_week0#{week}".to_sym)
        row_nums_7to10 << "  " unless month == 3
      end
      row_nums_7to10 << "\n"
    end

      i = 4
      row11_nums = ""
      while i < 7
        mike = MakeCal.new i, @year
        bill = mike.generate_week05.size
        if bill < 20
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
        i += 1
        row11_nums << mike.generate_week05 << padding << "  "
        else
          row11_nums << mike.generate_week05 << "  "
        i += 1
        end
      end
      row11_nums << "\n"

      i = 4
      row12_nums = ""
      while i < 7
        mike = MakeCal.new i, @year
        bill = mike.generate_week06.to_s.size
        if bill < 20 and bill > 1
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
        i += 1
        if mike.generate_week06 != 0
            row12_nums << mike.generate_week06 << "                    " << "  "
            i += 1
          elsif mike.generate_week06 == 0
            row12_nums << "                    " << "  "
            i += 1
          end
        # row12_nums << mike.generate_week06 << padding << "  "
        elsif bill == 1
          if mike.generate_week06 != 0
            row12_nums << mike.generate_week06 << "                    " << "  "
            i += 1
          elsif mike.generate_week06 == 0
            row12_nums << "                    " << "  "
            i += 1
          end
        else
          row12_nums << mike.generate_week06 << "  "
          i += 1
        end
      end
      if row12_nums.rstrip == ""
          row12_nums = "                                            "
      end
      row12_nums << "\n"

      # 7-9 #####################
      ###########################

    row_nums_13to16 = ""
    1.upto(4) do |week|
      7.upto(9) do |month|
        mike = MakeCal.new month, @year
        row_nums_13to16 << mike.send("generate_week0#{week}".to_sym)
        row_nums_13to16 << "  " unless month == 3
      end
      row_nums_13to16 << "\n"
    end

      i = 7
      row17_nums = ""
      while i < 10
        mike = MakeCal.new i, @year
        bill = mike.generate_week05.size
        if bill < 20
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
        i += 1
        row17_nums << mike.generate_week05 << padding << "  "
        else
          row17_nums << mike.generate_week05 << "  "
        i += 1
        end
      end
      row17_nums << "\n"

     i = 7
      row18_nums = ""
      while i < 10
        mike = MakeCal.new i, @year
        bill = mike.generate_week06.to_s.size
        if bill < 20 and bill > 1
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
        i += 1
        if mike.generate_week06 != 0
            row18_nums << mike.generate_week06 << "                    " #<< "a  "
            i += 1
          elsif mike.generate_week06 == 0
            row18_nums << "                    " << "  "
            i += 1
          end
        # row12_nums << mike.generate_week06 << padding << "  "
        elsif bill == 1
          if mike.generate_week06 != 0
            row18_nums << mike.generate_week06 << "                    " << "  "
            i += 1
          elsif mike.generate_week06 == 0
            row18_nums << "                    " << "  "
            i += 1
          end
        else
          row18_nums << mike.generate_week06 << "  "
          i += 1
        end
      end
      if row18_nums.rstrip == ""
          row18_nums = "                                            "
      end
      row18_nums #<< "\n"

      # 10-12 #####################
      #############################

    row_nums_19to22 = ""
    1.upto(4) do |week|
      10.upto(12) do |month|
        mike = MakeCal.new month, @year
        row_nums_19to22 << mike.send("generate_week0#{week}".to_sym)
        row_nums_19to22 << "  " unless month == 3
      end
      row_nums_19to22 << "\n"
    end

      i = 10
      row23_nums = ""
      while i < 13
        mike = MakeCal.new i, @year
        bill = mike.generate_week05.size
        if bill < 20
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
        i += 1
        row23_nums << mike.generate_week05 << padding << "  "
        else
          row23_nums << mike.generate_week05 << "  "
        i += 1
        end
      end
      row23_nums << "\n"

     i = 10
      row24_nums = ""
      while i < 13
        mike = MakeCal.new i, @year
        bill = mike.generate_week06.to_s.size
        if bill < 20 and bill > 1
          right_padding = (20 - bill)
          padding = ""
          while right_padding > 0
            padding = padding + " "
            right_padding = right_padding-1
          end
        i += 1
        if mike.generate_week06 != 0
            row24_nums << mike.generate_week06 << "                    " #<< "a  "
            i += 1
          elsif mike.generate_week06 == 0
            row24_nums << "                    " << "  "
            i += 1
          end
        # row12_nums << mike.generate_week06 << padding << "  "
        elsif bill == 1
          if mike.generate_week06 != 0
            row24_nums << mike.generate_week06 << "                    " << "  "

            i += 1
          elsif mike.generate_week06 == 0
            row24_nums << "                    " << "  "
            i += 1
          end
        else
          row24_nums << mike.generate_week06 << "  "
          i += 1
        end
      end
      # if row24_nums.rstrip == ""
      #     row24_nums = "f                                            "
      # end
      row24_nums << "\n"

    return "#{whole_year}#{month_header_01_of_03}#{days_header}\n#{row_nums_1to3}#{row05_nums.rstrip}\n#{row06_nums}#{month_header_04_of_06}#{days_header}\n#{row_nums_7to10}#{row11_nums.rstrip}\n#{row12_nums}#{month_header_07_of_09}#{days_header}\n#{row_nums_13to16}#{row17_nums.rstrip}\n#{row18_nums}\n#{month_header_10_of_12}#{days_header.rstrip}\n#{row_nums_19to22}#{row23_nums.rstrip}\n#{row24_nums}"
  end

end