require 'fileutils'

class SipsWorker
  attr_accessor :folder

  def initialize(folder)
    @folder = folder
  end

  def hookup_result
    4
  end

  def files
    Dir.entries(@folder)
  end

  def copy(file, modifier)
    FileUtils.chdir(@folder)
    base = File.basename(file, '.*')
    ext = File.extname(file)
    FileUtils.copy(file, base+modifier+ext)
    FileUtils.chdir('..')
  end
end