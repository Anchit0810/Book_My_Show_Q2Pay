class SeatSelect < SeatCount 
  ###### hello git ####
  def initialize
    super()
  end

  def seat_choice()

    begin
      @new_row = {}
      puts 'enter category of your choice'
      @seat.keys.each_with_index do |key,index|
        puts "#{index + 1}:#{key}"
      end
      choice = Integer(gets.chomp)
      case choice 
      when 1
        @category_choice = :silver
      when 2 
        @category_choice = :gold
      when 3 
        @category_choice = :platinum
      else 
        raise "invalid choice"
      end 
      puts @category_choice
    rescue => e
      puts "Error: Please Enter The metnioned Number only"
      retry
    end

    begin
      total=[]
      if @seat.keys.include?(@category_choice)
        @new_row = @seat[@category_choice]
        @new_row.each do |key,value|
          puts "#{key} #{value}"
        end
      else
        raise 'invalid selection'
      end
 
      @new_row.each_key do|key|
        total << @new_row[key]
      end
      total.flatten!
      puts "total seats in #{@category_choice} is #{total.length}"
      if @num_seat >= total.length
        warn "Warning:#{@category_choice} have only #{total.length} seats"
      end

      puts 'enter row'
      row = gets.chomp.upcase.to_sym

      if @new_row.keys.include?(row)
        print "#{row} #{@new_row[row]}\n"
        @selected_row = row
        @available_seat = @new_row[row]
      else 
        raise 'invalid choice row Alphabaticaly'
      end
    rescue => e 
      puts "Error: #{e}"
      retry 
    end
  end
end