class ConvertOl
  def change_ol(line)
    md_string = ""
    line.each_line do |line|
    md_string << "  <li>#{line[2..-1].strip}</li>\n"
  end
    md_string.prepend("<ol>\n")<<"</ol>\n\n"
  end
end
