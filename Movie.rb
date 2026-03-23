class Movie
  def initialize
   @movies=["batman","ironman","superman","spiderman","deadpool"]
   @count = 0 
  end

  def  movie_selection()
    begin  
      puts 'select a movie'
      @movies.each_with_index do |m,i|
        puts "#{i+1}.#{m}"
      end 
      puts 'select one'
      choice = gets.chomp.to_i
    
      if choice.between?(1,5)
        @selected_movie = @movies[choice - 1]
      else
        @count += 1
        raise 'invalid choice'
      end
     rescue => e
      puts "Error: #{e}"
        if @count >= 3
          puts "too many invalid selections"
          exit
        else 
          retry
        end
    end
  end  
end