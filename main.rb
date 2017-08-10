require_relative '../RubyProject/aluno.rb'
require_relative '../RubyProject/arquivo.rb'
require_relative '../RubyProject/menu.rb'
require 'csv'

class Main

  alunos = Arquivo.ler_alunos('alunos.csv')
  Menu.start(alunos)

end