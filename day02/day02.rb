filename = ARGV[0] || "example.txt"

file = File.readlines(filename)
total_reports_safe = 0

def check_if_report_safe(report)
  if all_increase_or_decrease(report) && level_differ_slightly(report)
    true
  else
    false
  end
end

def all_increase_or_decrease(report)
  incrementing?(report) || decrementing?(report)
end

def incrementing?(report)
  report.each_cons(2).all? do |a, b|
    a < b
  end
end

def decrementing?(report)
  report.each_cons(2).all? do |a, b|
    a > b
  end
end

def level_differ_slightly(report)
  report.each_cons(2).all? do |a, b|
    (a - b).abs > 0 && (a - b).abs < 4
  end
end

file.each do |report|
  # report is an array of string, turn into integers
  report = report.split.map(&:to_i)

  if check_if_report_safe(report)
    total_reports_safe += 1
  end
end

puts "Total Reports Safe: #{total_reports_safe}."
