class Statement
  def get_statement(transactions)
    header = %w[date credit debit balance]
    details = transactions.reverse.map { |transaction| get_data(transaction) }
    details.unshift(header)
  end

  def get_data(transaction)
    date = date_formatter(transaction[:date])
    amount = transaction[:amount]
    balance = amount_formatter(transaction[:balance])
    formatted_amount = amount_formatter(amount)
    if amount > 0
      [date, formatted_amount, '', balance]
    else
      [date, '', formatted_amount, balance]
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
