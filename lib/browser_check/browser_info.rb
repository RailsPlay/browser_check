module BrowserCheck

module BrowserInfo
  def browser_info
    unless @browser
      user_agent = request.env['HTTP_USER_AGENT']
      @browser = {}
      @browser[:platform] = case user_agent
        when /Windows/   then 'win'
        when /Macintosh/ then 'mac'
        when /Linux/     then 'lin'
      end
      @browser[:current] = Browsers[ UserAgents.select { |agent, browser|  agent =~ user_agent }.first.try(:second) ]
      @browser[:alternates] = Browsers.select { |n, b|  (b != @browser[:current]) && b[:platforms].include?(@browser[:platform]) }.map(&:second)
    end
    @browser
  end

protected
  Browsers = [
    ['Firefox',           %w{win mac lin}, 'http://getfirefox.com'],
    ['Opera',             %w{win mac lin}, 'http://www.opera.com/browser/download'],
    ['Chrome',            %w{win mac lin}, 'http://www.google.com/chrome'],
    ['Safari',            %w{win mac},     'http://www.apple.com/safari/download'],
    ['Internet Explorer', %w{win},         'http://www.microsoft.com/windows/internet-explorer/default.aspx'],
  ].inject({}) { |h, (name, plat, link)|  h[name] = { :name => name, :platforms => plat, :link => link } ; h  }.freeze
  UserAgents = {
    /Opera/  => 'Opera',
    /MSIE/   => 'Internet Explorer',
    /Chrome/ => 'Chrome',
    /Safari/ => 'Safari',
    %r{(Firefox/)|(Gecko/)} => 'Firefox',
  }.freeze
end

end