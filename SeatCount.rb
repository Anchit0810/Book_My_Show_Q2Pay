class SeatCount < Theater 
###### hello git ####
  def initialize
    @@booked_seats = {}
    super()
    @theater_selection  
    @hall = [:pvr, :inox , :cinepolis] 
    @num_seat = 0   
  end

  def ticket_count         
    puts "\nhow many seat ? #{1..10}"
    @num_seat = gets.chomp.to_i
    if @num_seat > 10 || @num_seat <= 0 
      puts 'invalid seat count'
      warn 'Warning:maximum limit is 10'
      ticket_count()
    end
  end

  def print_seats 
    price = {silver: 150 , gold: 250 , platinum: 350}
    @seat = {silver: {A: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10],B: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10], C: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10]} , gold: {D: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10],E: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10], F: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10]},
    platinum:{G: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10],H: [1 , 2 , 3 , 4 , 5 , 6, 7, 8, 9, 10]}}
    
    if @@booked_seats[@selected_movie] &&  @@booked_seats[@selected_movie][@theater_selection]
      booked = @@booked_seats[@selected_movie][@theater_selection]
      puts "bokked seat #{booked}"
      booked.each do |category,rows|
        rows.each do |row,seats|
          @seat[category][row] -= seats 
        end
      end
    end  
    @seat.each do |key , value|
      rates = price[key]
      puts "#{key},#{rates}"
      value.each do |row_name,row_seats|
        puts "#{row_name},#{row_seats}"
      end
    end
  end
end