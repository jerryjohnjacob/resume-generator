require "resume"

class ResumeReader
  def read_from_console
    resume = Resume.new
    resume.name = get_input("Name: ")
    resume.age = get_input("Age: ").to_i
    resume.institution = get_input("Institution: ")
    resume.experience = get_input("Experience: ").to_i
    resume
  end

  def get_input(instruction)
    print instruction
    gets.chomp
  end
end
