require 'csv'
class Menu

  def self.start(alunos)
    begin
      puts 'Digite sua matricula'
      matricula = gets.chomp #'109647' #107354
      aluno = Aluno.buscar_aluno_matricula(matricula.to_s, alunos).first #pega o primeiro aluno do array
      if aluno.ativo? # so podem criar uffmail alunos que tem status = ativo
        unless aluno.uffmail? #.to_s # so pode criar uffmail alunos que nao tem uffmail
          hash_emails = aluno.gerar_opcoes_email #qual o retorno?? hash
          Menu.exibir_opcoes(hash_emails)
          opcao_email=gets.chomp.to_s
          Menu.case_opcoes(opcao_email, hash_emails, aluno)
          puts "A criação de seu e-mail #{aluno.uffmail} "\
               "será feita nos próximos minutos. Um SMS foi"\
               " enviado para #{aluno.telefone} com a sua senha de acesso."
          Arquivo.atualizar_csv('alunos.csv', alunos)
        end
      end
      puts 'Digite 0 para sair 1 para continuar'
      sair = gets.chomp.to_i
    end while sair != 0
  end

  def self.exibir_opcoes(hash_emails)
    puts 'Escolha uma opção:'
    hash_emails.each do |opcao, email|
      puts "#{opcao} - #{email}"
    end
  end

  def self.case_opcoes(opcao_email, hash_emails, aluno)
    case opcao_email
      when '1'
        aluno.uffmail=hash_emails[opcao_email]
      when '2'
        aluno.uffmail=hash_emails[opcao_email]
      when '3'
        aluno.uffmail=hash_emails[opcao_email]
      when '4'
        aluno.uffmail=hash_emails[opcao_email]
      when '5'
        aluno.uffmail=hash_emails[opcao_email]
      else
        'Opção inválida!'
    end
  end
end
