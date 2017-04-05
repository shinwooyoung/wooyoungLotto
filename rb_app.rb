#setting up
restaurants = {
    "vips" => ["western", "steak", 4.5],
    "Fridays" => ["western","potato", 3.8],
    "jijigo" => ["korean", "noodle", 2.8]
}

puts "What would you like to do?"
choice = gets.chomp

#The case statement

while true
    case choice
        when "add"
            puts "What's your restaurant name?" #add_1
            restaurant = gets.chomp
            
            restaurants.each do |k, c, m, r|
                if k == restaurant
                    puts "That restaurant already exists!. Its rating is #{restaurants[restaurant.to_s]}"
                    break
                else
                    puts "Intput category. You can push korean, chinese, japanese, western"
                    category = gets.chomp
                    
                    c = case category
                        when "korean" then true
                        when "chinese" then true
                        when "japanese" then true
                        when "western" then true
                    else puts "잘못된 입력입니다."
                         puts puts "Intput category. You can push korean, chinese, japanese, western"
                        category = gets.chomp
                    end
                
                
                    puts "Input menu"
                    menu = gets.chomp
                        
                    puts "Input rating(0 - 5)"
                    rating = gets.chomp
                    
                    r = case rating
                        when 0..5 then true
                        else puts "잘못된 입력입니다."
                            puts "Input rating(0 - 5)"
                            rating = gets.chomp
                    end
                    
                    break
                end
            end
            
            #restaurants[v] = category
            #restaurant[v] = menu
            #restaurants[v] = rating
            #if restaurants.has_value?(v)
                
            
          break
          
        when "update"
            puts "Whats the restaurant you want to update?"
            update = gets.chomp
            if restaurants[restaurant.to_s].nil?
                puts "#{update} not found!"
            else
                puts "Whats the new rating (0-5)?"
                rating = gets.chomp
                restaurants[restaurant.to_s] = rating.to_i
                puts "#{update} has been updated with the a new rating of #{rating}!"
            end
            
            break
        when "display"
            puts restaurants[rating].sort!
            
            restaurants.each do |restaurant, category, menu, rating|
                puts "#{restaurant}, #{category}, #{menu} #{rating}"
            end
            
            break
        when "delete"
            puts "Enter the title to delete!"
            restaurant = gets.chomp
            if restaurants[restaurant.to_s].nil?
                "Restaurants #{restaurant} not in database!"
            else restaurants.delete(title)
                puts "Restaurants #{restaurant} has been deleted!"
            
            end
            break
        when "exit" 
            break
        else
            puts "Error!"
            
        break if e.choice == "exit"
    end
end






    
    
  
