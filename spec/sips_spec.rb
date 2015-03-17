require 'rspec'
require_relative '../sips_work'

describe "hookup" do
  before :each do
    @sw = SipsWorker.new('images')
  end

  it "should return 4 from hookup" do
    expect(2+2).to be(4)
  end

  it "should hook up to SipsWorker" do
    expect(@sw.hookup_result).to be(4)
  end
end

describe "file manager" do
  before :each do
    @sw = SipsWorker.new('images')
  end

  it "should set folder" do
    @sw.folder = 'mumble'
    expect(@sw.folder).to eq('mumble')
  end

  it "should find files" do
    expect(@sw.files).to  include('jpeg-file.jpg')
    expect(@sw.files).to  include('png-file.png')
    @sw.copy('jpeg-file.jpg', '-medium')
    expect(@sw.files).to include('jpeg-file-medium.jpg')
  end

  after :each do
    Dir.foreach('images') do |f|
      FileUtils.remove_file('images/'+f) if f.include?('-medium.')
      FileUtils.remove_file('images/'+f) if f.include?('-small.')
    end
  end
end