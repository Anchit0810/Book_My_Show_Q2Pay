require_relative 'Movie.rb'
require_relative 'Theater.rb'
require_relative 'SeatCount.rb'
require_relative 'SeatSelect.rb'
require_relative 'TicketBook.rb'
###### hello git ####
class MainMenu
  def initialize
    @ticket_data = nil
  end
 
  def menu 
    bookticket = TicketBook.new
    while (true)
      begin
        puts "\nEnter the Operation you want to perform"
        puts '1.Book Movie Ticket' 
        puts '2.View Movie Ticket'  
        puts '3.Cancel Ticket'
        puts '4.Exit'
  
        input = Integer(gets.chomp)
        case input
        when 1
          bookticket.movie_selection
          bookticket.theater_selection
          bookticket.ticket_count
          bookticket.print_seats
          bookticket.seat_choice
          bookticket.seat_book
          @ticket_data = bookticket.confirm_booking
        when 2 
          bookticket.view_ticket
        when 3 
          bookticket.cancel_ticket
        when 4 
          puts 'see you next time..'
          exit
        else 
          puts 'invalid entry'
        end
      rescue ArgumentError
        puts "Invalid input Please Enter A number"
        retry 
      end  
    end 
  end
end
main = MainMenu.new
main.menu