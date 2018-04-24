class Statement
  def get_statement(transactions)
    header = 'date || credit || debit || balance'
    details = transactions.reverse.map { |transaction| get_data(transaction) }
    header + "\n" + details.join("\n")
  end

  def get_data(transaction)
    date = date_formatter(transaction[:date])
    amount = transaction[:amount]
    balance = amount_formatter(transaction[:balance])
    if amount < 0
      "#{date} || || #{amount_formatter(amount)} || #{balance}"
    else
      "#{date} || #{amount_formatter(amount)} || || #{balance}"
    end
  end

  private

  def amount_formatter(amount)
    format('%.2f', amount.abs)
  end

  def date_formatter(date)
    date.strftime("%d/%m/%Y")
  end
end
