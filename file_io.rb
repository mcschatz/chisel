class Write_file
  def html_file(content)
    File.open('output.html', 'w') do |file|
      puts content
      file.write(content)
    end
  end
end
