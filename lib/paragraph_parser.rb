class Paragraph_parser
  def strong(line)
    while line.include?("**")
      line.sub!("**", "<strong>")
      line.sub!("**", "</strong>")
  end
    emphasis(line)
  end

  def emphasis(line)
    while line.include?("*")
      line.sub!("*", "<em>")
      line.sub!("*", "</em>")
    end
      paragraph(line)
  end

  def paragraph(line)
    line = "<p>\n#{line}\n</p>\n\n"
  end
end
