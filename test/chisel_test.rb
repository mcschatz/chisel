gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'chisel'
require_relative 'header'
require_relative 'ul_list'
require_relative 'ol_list'
require_relative 'paragraph_parser'
require_relative 'file_io'

class ChiselTest < Minitest::Test

  def test_header_change
    text = Chisel.new("#Hello, world.")
    assert header?(text)
  end

  # def test_it_can_put_text_with_hash
  #   text = Chisel.new("#Hello, world.")
  #   assert_equal "#Hello, world.", text.line
  # end
  #
  # def test_it_can_put_text_with_emphasis
  #   text = Chisel.new("*Hello, world.")
  #   assert_equal "*Hello, world.", text.file
  # end
  #
  # def test_it_can_put_text_with_empty_lines
  #   text = Chisel.new("Hello, world.
  #   ")
  #   assert_equal "Hello, world.", text.file
  # end
  #
  # def test_it_can_put_lists
  #   text = Chisel.new("* unicorn * vampire")
  #   assert_equal "* unicorn * vampire", text.file
  # end
  #
  # def test_it_knows_a_hash
  #   text = Chisel.new("#Hello, world.")
  #   assert text.header?
  # end
  #
  # def test_it_knows_an_ul
  #   text = Chisel.new("* Hello, world. * What's up?")
  #   assert text.ul?
  # end
  #
  # def test_it_knows_an_ol
  #   text = Chisel.new("1. Hello, world.")
  #   assert text.ol?
  # end
end
