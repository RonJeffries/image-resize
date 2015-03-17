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
    puts "Each in #{Dir.entries('images')}"
    FileUtils.rm_f(Dir.glob('images/*'))
    puts "empty in #{Dir.entries('images')}"
    FileUtils.cp_r('images-backup/.', 'images/')
    puts "reloaded in #{Dir.entries('images')}"
  end

  it "should set folder" do
    @sw.folder = 'mumble'
    expect(@sw.folder).to eq('mumble')
  end

  after :each do
    puts "mediums #{Dir.glob('images/*-medium.*')}"
    Dir.foreach('images') do |f|
      FileUtils.remove_file('images/'+f) if f.include?('-medium.')
      FileUtils.remove_file('images/'+f) if f.include?('-small.')
    end
    puts "Clean #{Dir.entries('images')}"
  end

  it "should find files" do
    expect(@sw.files).to  include('agile-barrier-1024x598.jpg')
    expect(@sw.files).to  include('planningDetail.png')
    @sw.copy('agile-barrier-1024x598.jpg', '-medium')
    expect(@sw.files).to include('agile-barrier-1024x598-medium.jpg')
  end

  it "should give me some info" do
    expect(`sips --getProperty pixelWidth images-backup/planningDetail.png`).to eq("")
  end
end