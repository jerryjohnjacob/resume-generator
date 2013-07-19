require 'active_support/core_ext'

class FormatManager
  def fetch_formats
    generator_set = []
    generator_filenames = Dir.entries("generators/").each { |generator| if (extension=generator=~/rb/) then generator_set << generator[0,extension-1] end }
    generator_set
  end

  def retrieve_class_name(userclassfile)
    require "generators/"+userclassfile
    userclassfile.camelize.constantize
  end
end
