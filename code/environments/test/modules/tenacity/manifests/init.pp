#tenacity class
class tenacity($server = 'Tenacity!') {
  notify { 'Server Greetings':
    message => "Hello from ${server}",
  }
}
