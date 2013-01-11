class Heroku::Client
  def get_invoice(opts = 'current')
    url = if opts.is_a?(Array)
            "#{y}/#{m}"
          else
            "current"
          end
    get("invoices/show/#{url}").to_s
  end
end
