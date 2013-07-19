class TxtGenerator
  def initialize(resume)
    @resume = resume
  end
  
  def data_record
    record = [@resume.name, @resume.age, @resume.institution, @resume.experience]
  end

  def create_output_file
    txtfile = File.open("./output_files/resume.txt", 'w')
    data_record.each { |data_entry| txtfile.puts data_entry }
    txtfile.close
  end

end
