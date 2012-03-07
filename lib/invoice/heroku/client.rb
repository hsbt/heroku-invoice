class Heroku::Client
  def get_invoice(y, m)
    get("invoices/show/#{y}/#{m}").to_s
  end
end
