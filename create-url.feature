Feature: Usuário não logado
  Como um usuário não logado,
  Quero encurtar uma URL mais longa,
  Para compartilhar um link mais elegante em qualquer outro lugar.

  Cenário: Gerando uma url encurtada sem autenticação
    Dado que o usuário está deslogado
    E solicitou o encurtamento de uma URL
    E não preencheu o input
    Então o sistema deve exigir o preenchimento do campo.

    Dado que o usuário está deslogado
    E informou um link que já está encurtado
    Quando o usuário solicitar o encurtamento do link 
    Então o sistema deve informá-lo de que essa operação não é possível.

    Dado que o usuário está deslogado
    E incluiu o link não encurtado no input
    Quando o usuário solicitar o encurtamento do link
    E a autenticação ocorrer com sucesso
    Então o sistema deve prosseguir com a solicitação
    E gravar a url gerada no cache


Feature: Usuário logado
  Como um usuário logado,
  Quero ao acessar o site, verificar todas as minhas urls encurtadas ou gerar uma nova url
  Para compartilhar um link mais elegante em qualquer outro lugar.

  Cenário: Gerando uma url encurtada com autenticação
    Dado que o usuário acessou o site autenticado
    Então o sistema deve redireciona-lo para a página de urls encurtadas por ele

    Dado que o usuário está logado
    E incluiu o link não encurtado no input
    Quando o usuário solicitar o encurtamento do link 
    Então o sistema deve prosseguir com a solicitação do usuário
    E Gravar a url gerada no cache
    
    Dado que o usuário informou um link que já está encurtado
    Quando o usuário solicitar o encurtamento do link 
    Então o sistema deve informá-lo de que essa operação não é possível.

    Dado que o usuário solicitou o encurtamento de uma URL
    E não preencheu o input
    Então o sistema deve exigir o preenchimento do campo.

    Dado que o usuário logado deu refresh na página que encurta links
    E possui um link encurtado no cache
    Então o sistema deve exibir essa url encurtada
    E não deve fazer nenhuma requisição de encurtamento

    Dado que o usuário logado deu refresh na página que encurta links
    E possui um link encurtado no cache
    E apagou o link encurtado do cache
    E verificou-se que existe uma URL identica já encurtada por ele
    Então o sistema deve retornar uma mensagem de erro
    E não deve fazer nenhuma requisição de encurtamento
