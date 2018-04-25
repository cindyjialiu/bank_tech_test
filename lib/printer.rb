class Printer
  def print(statement)
    puts statement.map { |transaction| transaction.join(' || ') }.join("\n").to_s
  end
end
