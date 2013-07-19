#this is the primary file to use to get the whole setup working

require "resume_reader"
require "resume"
require "format_manager"

class Main
  def initialize
    @resume = Resume.new
    @generator_set = []
    @formatmanager = FormatManager.new
  end

  def get_resume_data
    reader = ResumeReader.new
    @resume = reader.read_from_console
  end

  def fetch_generators
    @generator_set = @formatmanager.fetch_formats
  end

  def show_menu
    count = 1
    print "Available Generators\n"
    @generator_set.each { |generator| generator = generator.split("_").join(" "); puts (count.to_s + ". " + generator); count+=1 }
    print "Enter choice: "
    userchoice=gets.chomp
  end

  def call_generator(userchoice)
    userclass = @formatmanager.retrieve_class_name(@generator_set[userchoice])
    generator = userclass.new(@resume)
    generator.create_output_file
  end
end
