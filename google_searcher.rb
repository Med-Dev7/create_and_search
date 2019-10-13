
require 'launchy'
    # L'utilisateur rentre un ARGV à l'exécution du programme
    # Si ce dernier ne rentre pas d'ARGV, le programme va lui dire comment ça marche
  def check_if_user_gave_input
    abort("lance ton programme et ajoute comme input a la suite la recherche google que tu veux faire !") if ARGV.empty?
  end
    # L'ARGV correspond à ce que l'utilisateur veut rechercher sur Google
    # Le programme va récupérer l'ARGV, contruire une URL à partir de l'ARGV
def create_url
  return url = ARGV.join("+")
  # "hello".gsub(/[aeiou]/, '*')
end

    # Puis le programme va ouvrir un nouvel onglet à partir de cette recherche
def open_url(url)
  Launchy.open("http://google.com/search?q=#{url}")
  # https://www.google.com/search?q=how+to+center+a+div.
end

def perform
    check_if_user_gave_input
    open_url(create_url)
end
perform
