class Heroku::Command::Invoice < Heroku::Command::Base
  def index
    write_body(filename)
  end

  def pdf
    require 'tempfile'

    t = Tempfile.new
    write_body(t.path)
    system "wkhtmltopdf #{t.path} #{filename.sub(/\.html\z/, '.pdf')}"
    t.flush
  end

private

  def write_body(name)
    Zlib::GzipReader.wrap(StringIO.new(get_body)) do |gz|
      File.open(name, 'w'){|f| f.print gz.read}
    end
  end

  def get_body
    heroku.get_invoice(optparse).net_http_res.body
  end

  def filename
    "%04d%02d.html" % optparse
  end

  def optparse
    if args[0]
      args[0].scan(/(\d{4})(\d{2})/).first.map(&:to_i)
    else
      t = Time.now
      [t.year, t.month]
    end
  end
end
