Pod::Spec.new do |s|
  s.name             = "HTMLSpecialCharacters"
  s.version          = "1.3.4"
  s.summary          = "Library to escape/unescape HTML special characters in Swift."
  s.description      = <<-DESC
                      Library to escape/unescape HTML special characters in Swift. Google Toolbox for Mac is known as a great library which supports escaping/unescaping HTML special characters. But it's written in Objective-C.
                       DESC
  s.homepage         = "https://github.com/sonsongithub/HTMLSpecialCharacters"
  s.license          = 'MIT'
  s.author           = { "sonson" => "yoshida.yuichi@gmail.com" }
  s.source           = {
    :git => "https://github.com/sonsongithub/HTMLSpecialCharacters.git",
    :tag => "#{s.version}",
    :submodules => true
  }

  s.social_media_url = 'https://twitter.com/sonson_twit'
  s.ios.deployment_target = "8.4"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.2"
  s.requires_arc = true

  s.source_files = [
    'Sources/*.swift'
  ]
end
