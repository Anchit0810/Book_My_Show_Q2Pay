class TicketBook < SeatSelect
  def initialize
    @@ticket_array = []
    super() 
  end

  def seat_book
    @seat_numbers=[]
    @num_seat.times do |i|  
      puts 'enter seat number you want to book '
      @seat_numbers.push(Integer(gets.chomp))  
    end

    @seat_numbers.sort!
    puts "#{@seat_numbers}"

    @seat_numbers.each do |element|
      if !@available_seat.include?(element)
        puts 'error wrong number of seat or seat not present'
        return        
      end 
    end
    @@booked_seats[@selected_movie] ||= {}
    @@booked_seats[@selected_movie][@theater_selection] ||= {}
    @@booked_seats[@selected_movie][@theater_selection][@category_choice] ||= {}
    @@booked_seats[@selected_movie][@theater_selection][@category_choice][@selected_row] ||= []
    @@booked_seats[@selected_movie][@theater_selection][@category_choice][@selected_row] += @seat_numbers
    puts "#{@@booked_seats}"
    puts 'seat booked successfully'
  end

  def confirm_booking
    puts "\nBooking Summary"
    puts "Movie: #{@selected_movie}"
    puts "Theater: #{@theater_selection}"
    puts "Row: #{@selected_row}"
    puts "Seats: #{@seat_numbers}"
    puts "Total Seat: #{@seat_numbers.length}\n"

    puts 'Confirm Booking?(y/n)'
    ans = gets.chomp.downcase
    @ticket_id = rand(100000..1000000)

    @@ticket_array << {Id: @ticket_id,
                      Movie: @selected_movie,
                      Theater: @theater_selection,
                      Row: @selected_row,
                      Seats:@seat_numbers}



    @ticket_details = {Id: @ticket_id,Movie: @selected_movie,Theater: @theater_selection,Row: @selected_row,Seats:@seat_numbers}
    
    if ans != "y"
      puts 'Booking Cancelled'
      exit
    else 
      puts "Booking Done\n"
     @ticket_details.each do|key , value|
        puts"#{key}: #{value}"
        
      end
      return @ticket_details
    end 
  end 

  def view_ticket
    puts 'Enter Ticket-Id'
    id = gets.chomp.to_i
    ticket = @@ticket_array.find{|t| t[:Id] == id }
    if ticket
      puts "\nTicket Details"
      ticket.each do |key,value|
        puts "#{key}:#{value}"
      end 
    else 
      puts 'Ticket not found'
    end 
  end

  def cancel_ticket
    puts 'Enter Ticket-Id'
    id = gets.chomp.to_i
    
    ticket = @@ticket_array.find{|t| t[:Id] == id}
    if ticket.nil?
      puts 'Ticket not found'
    else 
      @@ticket_array.delete(ticket)
      puts 'Ticket cancelled..'
    end 
  end 
end