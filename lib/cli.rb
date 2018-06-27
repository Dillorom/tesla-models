class TeslaModels::CLI

  def call
    puts "Welcome to the Tesla World!"
    TeslaModels::Scrape.scrape_all
    list_models
    menu
    goodbye
  end

  def list_models
    puts "Here is the list of Tesla Models:"
    @models = TeslaModels::Model.all
    @models.each.with_index(1) do |model, i|
      puts "#{i}. #{model.name} - #{model.price} - #{model.availability}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the model you would like to know more about or type list to see the models or type exit to exit:"
      input = gets.strip.downcase
      #between?
        if input.to_i > 0 && input.to_i < @models.size+1
          the_model = @models[input.to_i-1]
          puts "Name: #{the_model.name}, Price: #{the_model.price}, Availability: #{the_model.availability}, Acceleration speed: #{the_model.acceleration_speed}, Horsepower: #{the_model.horsepower}, Top speed: #{the_model.top_speed}, URL: #{the_model.url}"
        elsif input == "list"
          list_models
        elsif input == "exit"
          break
        else
          puts "Invalid entry. Please, type list to see the list of models."
        end
    end
  end

  def goodbye
    puts "Thank you for visiting us! GoodBye!"
  end

end
