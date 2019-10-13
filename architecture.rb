#
# Création d'un dossier qui porte le nom de l'ARGV de l'utilisateur
#     Si l'utilisateur ne rentre pas de ARGV ou s'il rentre un ARGV avec plusieurs mots, le programme doit dire à l'utilisateur comment s'en servir et s'arrêter
def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

# Création du Gemfile avec les gems de THP
def create_gemfile_and_write()
  system("bundle init")
  file = File.open("Gemfile", "a")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'pry'")
  file.puts("gem 'rspec'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'nokogiri'")
  file.close
  system("bundle install")
end

# Git init
def system_call_git_init
  system("git init")
end

# Création du fichier .env, puis on le met dans le fichier gitignore
def system_call_dotenv
  File.open(".env", "w+")
  system("mv .env gitignore")
  
end

# Création du dossier lib
def create_lib
  Dir.mkdir("lib")
end

# rspec --init
def system_call_rspec
  system("rspec --init")
end

# Création d'un Readme.md qui va dire que c'est un programme Ruby
def create_readme
  File.open("Readme.md", "w+")
end

# Évidemment, tu vas créer un alias qui va s'occuper de pouvoir appeler ton programme avec mkdiruby (ou autre)
def perform
    check_if_user_gave_input
    name = get_folder_name
    create_folder(name)
    Dir.chdir("./#{name}") do
      system("cd ./#{name}")
      create_gemfile_and_write
      system_call_git_init
      system_call_dotenv
      create_lib
      system_call_rspec
      create_readme
  end

    puts "ok"
end
perform
