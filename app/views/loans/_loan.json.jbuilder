json.extract! loan, :id, :loanDate, :returnDate, :created_at, :updated_at
json.url loan_url(loan, format: :json)
