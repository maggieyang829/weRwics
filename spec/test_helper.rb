def sample_file(filename = "1.txt")
  File.new("spec/fixtures/#{filename}")
end