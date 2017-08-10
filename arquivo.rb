require 'csv'

class Arquivo
  def self.ler_alunos(file)
    alunos = []
    CSV.foreach(file) do |linha| #abre e le o arquivo até o final
      string = linha #.split(",") #faz o split na linha e coloca no array de string
      alunos << Aluno.new(string[0], string[1], string[2],
                          string[3], string[4], string[5])
    end
    alunos #retorna o array de alunos
  end

  def self.atualizar_csv(file, alunos)
    CSV.open(file, "w") do |csv|
      alunos.each do |aluno|
        csv << aluno.to_csv
      end
    end
  end
end
