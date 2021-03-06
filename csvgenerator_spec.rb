$: << '.'

require "resume_reader"
require "resume"
require "format_manager"
require "generators/pdf_generator"
require "generators/csv_generator"
require "main"

describe "main class functionality" do
  it "should call the appropriate method depending on user choice" do
    main = Main.new
    main.fetch_generators
    PdfGenerator.any_instance.should_receive(:create_output_file)
    main.call_generator(1)
  end
end

describe "storing data in the resume object" do
  it "should accept user input" do
    reader = ResumeReader.new
    reader.stub(:get_input).with("Name: ").and_return("Greg")
    reader.stub(:get_input).with("Age: ").and_return(30)
    reader.stub(:get_input).with("Institution: ").and_return("TVS")
    reader.stub(:get_input).with("Experience: ").and_return(3)
    resume = reader.read_from_console
    resume.name.should == "Greg"
    resume.age.should == 30
    resume.institution == "TVS"
    resume.experience == 3
  end
end

describe "load the resume generator of given format" do
  before(:each) do
    @resume = Resume.new
    @resume.name = "Greg"
    @resume.age = 30
    @resume.institution = "TVS"
    @resume.experience = 3
  end

  it "should load the csv generator" do
    csvgenerator = CsvGenerator.new(@resume)
    csvgenerator.data_record.should == [@resume.name, @resume.age, @resume.institution, @resume.experience]
  end

  it "should load the pdfgenerator" do
    pdfgenerator = PdfGenerator.new(@resume)
    pdfgenerator.data_record.should == [@resume.name, @resume.age, @resume.institution, @resume.experience]
  end

  it "should load generator classes automatically" do
    formatmanager = FormatManager.new

    #fetch files from generators folder
    available_formats = formatmanager.fetch_formats
    available_formats.should_not be_nil

    #test a generator
    userclass = formatmanager.retrieve_class_name(available_formats[0])
    userclass.should == CsvGenerator
    userformatgenerator = userclass.new(@resume)
    userformatgenerator.data_record.should == [@resume.name, @resume.age, @resume.institution, @resume.experience]
  end
end
