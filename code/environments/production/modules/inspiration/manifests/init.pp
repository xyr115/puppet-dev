#Inspiration class
class inspiration($server = 'absented server') {
  notify { 'Warm Hello'
    message => "Greetings from ${server}",
  }
}
