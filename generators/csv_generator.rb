require 'csv'

class CsvGenerator
  def initialize(resume)
    @resume = resume
  end
  
  def data_record
    record = [@resume.name, @resume.age, @resume.institution, @resume.experience]
  end

  def create_output_file
    CSV.open("./output_files/resume.csv", "wb") do |csv|
      csv << data_record
    end
  end
end
