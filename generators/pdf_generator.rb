require 'prawn'

class PdfGenerator
  def initialize(resume)
    @resume=resume
  end

  def data_record
    record = [@resume.name, @resume.age, @resume.institution, @resume.experience]
  end

  def create_output_file
    pdf = Prawn::Document.new
    data_record.each { |data_field| pdf.text data_field.to_s }
    pdf.render_file "./output_files/resume.pdf"
  end
end
