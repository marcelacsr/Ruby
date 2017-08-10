class Aluno
  attr_accessor :nome, :matricula, :telefone, :email, :uffmail, :status #gets e sets
  def initialize(nome, matricula, telefone, email, uffmail, status)
    @nome=nome
    @matricula=matricula
    @telefone=telefone
    @email=email
    @uffmail=uffmail
    @status=status
  end

  def self.buscar_aluno_matricula(matricula, alunos)
    alunos = alunos.select do |aluno| #percorrendo o vetor de alunos e retorna um novo array que satisfaça a condição abaixo
      matricula == aluno.matricula #pega mat passada e compara com a matricula do |aluno| atual
    end
     return puts 'Matricula nao existe' if alunos.empty?
    alunos
  end

  def ativo? #verifica se o aluno está com status = INATIVO
    if @status=="Inativo"
      puts "Apenas alunos ativos podem criar um UffMail"
      return false #retorna falso para a chamada
    end
    true
  end

  def uffmail?
    unless @uffmail.to_s.empty? #verifica se o aluno tem uffmail, se não for vazio retorna true
      puts "Um aluno só pode ter um UFFmail" #caso o aluno ja tenha uffmail, retorna a msg e retorna false
      return true
    end
    false
  end

  def gerar_opcoes_email
    opcoes = {} #Hash.new
    nome = self.nome.split(' ') #nome do objeto #this.nome # aluno.nome
    opcoes['1'] = "#{nome.first}_#{nome.last}@id.uff.br".downcase #1 - laura_azevedo@id.uff.br
    opcoes['2'] = "#{nome.first}#{nome[1][0]}#{nome.last[0]}@id.uff.br".downcase #2 - lauraac@id.uff.br
    opcoes['3'] = "#{nome.first}#{nome.last}@id.uff.br".downcase #3 - lauracunha@id.uff.br
    opcoes['4'] = "#{nome.first[0]}#{nome.last}@id.uff.br".downcase #4 - lcunha@id.uff.br
    opcoes['5'] = "#{nome.first[0]}#{nome[1]}#{nome.last}@id.uff.br".downcase #5 - lazevedocunha@id.uff.br
    opcoes #retorna o hash
  end

  def to_csv
    [nome, matricula, telefone, email, uffmail, status]
  end
end