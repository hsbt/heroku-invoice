require 'json'

class Heroku::Command::Invoice < Heroku::Command::Base
  def index
    write_body
  end

  def pdf
    require 'fileutils'
    write_body
    system "wkhtmltopdf #{filename} #{filename.sub(/\.html\z/, '.pdf')}"
    FileUtils.rm filename
  end

private

  def write_body
    body = get_body
    File.open(filename, 'w'){|f| f.print body }
  end

  def get_body
    JSON.parse(heroku.get_invoice(*optparse))['attrs']['html']
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
