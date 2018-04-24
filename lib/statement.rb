class Statement

  def get_statement(transactions)
    header = 'date || credit || debit || balance'
    details = transactions.reverse.map do |transaction|
      date = date_formatter(transaction[:date])
      credit = transaction[:credit]
      debit = transaction[:debit]
      balance = format('%.2f', transaction[:balance])

      if credit.nil?
        "#{date} || || #{format('%.2f', debit)} || #{balance}"
      elsif debit.nil?
        "#{date} || #{format('%.2f', credit)} || || #{balance}"
      end
    end
    header + "\n" + details.join("\n")
  end

  private

  def date_formatter(date)
    date.strftime("%d/%m/%Y")
  end
end
