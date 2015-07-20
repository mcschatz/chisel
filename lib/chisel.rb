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
    read_markdown_content(file)
  end

  def read_markdown_content(file)
    lines = File.open(file).read.split("\n\n")
    converted_file = process_file(lines)
    write_file(converted_file)
  end

  def process_file(lines)
    content = ""
    lines.each do |line|
      case line != nil
      when header?(line)
        content << ConvertHeaders.new.html_headers(line)
      when ul?(line)
        content << ConvertUl.new.change_ul(line)
      when ol?(line)
        content << ConvertOl.new.change_ol(line)
      when empty?(line)
        content << line
      else
        content << ParagraphParser.new.strong(line)
      end
    end
    content
  end

  def write_file(file)
    WriteFile.new.html_file(file)
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
