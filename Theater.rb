class Theater < Movie

  def initialize
    super()
    @theater = {inox: ["batman","ironman","superman"], pvr: ["ironman","spiderman","superman"],cinepolis: ["batman","superman","spiderman"]}
  end

  def theater_selection()
    @available = []
    @count = 0 
    @theater.each do |hall,show|
      if show.include?(@selected_movie)
        @available << hall 
      end      
    end
    
    if @available.empty?
      puts"no Theaters are showing #{@selected_movie}"
      movie_selection()
      theater_selection()
    else
      begin
        puts "Theaters showing #{@selected_movie}"
        @available.each_with_index do |t,i|
          puts "#{i+1}.#{t}"
        end
        puts '#select one#'
        choice = Integer(gets.chomp)

        if @theater_selection = @available[choice - 1]
          return @theater_selection
        else
          @count += 1
          raise "invalid selection" 
        end
      rescue => e
        puts "Error: #{e}"
        if @count >= 3
          puts "too many invalid selection"
          exit 
        else 
          retry
        end
      end
    end  
  end
end