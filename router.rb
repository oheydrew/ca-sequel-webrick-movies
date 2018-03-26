require 'sequel'
require 'WEBrick'
require 'pry'

require_relative 'models/movie'

class Router < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    case request.path
    when '/'
      movies = Movie.order(:title).exclude(cover_url: nil)
      render = ERB.new(html_file('index.html.erb'))

      response.status = 200
      response['Content-Type'] = 'text/html'
      response.body = render.result(binding)

    else
      response.status = 400
      response.body = "Route not found."
    end
  end

  private
  def html_file(file)
    path = File.join(__dir__, 'public', file) # output: '$pwd/public/file' ie '$pwd/private/index.html
    html = File.open(path).read
    return html
  end
end
