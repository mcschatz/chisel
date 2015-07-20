require 'pry'
require_relative 'header'
require_relative 'ul_list'
require_relative 'ol_list'
require_relative 'paragraph_parser'
require_relative 'file_io'

file = ARGV[0]
raise "You must pass in an input file." if file == nil

class Chisel
  attr_accessor :line

  def initialize(file)
    process_file(file)
  end

  def process_file(file)
    content = ""
    File.open(file).read.split("\n\n").each do |line|
      case line != nil
      when header?(line)
        content << Convert_headers.new.convert_headers(line)
      when ul?(line)
        content << Convert_ul.new.change_ul(line)
      when ol?(line)
        content << Convert_ol.new.change_ol(line)
      when empty?(line)
        content << line
      else
        content << Paragraph_parser.new.strong(line)
      end
    end
    Write_file.new.html_file(content)
  end

  def header?(line)
    line.start_with?('#')
  end

  def ul?(line)
    line.start_with?('* ')
  end

  def ol?(line)
    line[0].to_i > 0
  end

  def empty?(line)
    line.empty?
  end
end

Chisel.new(file)
