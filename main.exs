defmodule CadastroClientes do
  defstruct cpf: "", nome: "", email: "", telefone: ""

  def criar_cliente(cpf, nome, email, telefone) do
    %CadastroClientes{cpf: cpf, nome: nome, email: email, telefone: telefone}
  end

  def imprimir_cliente(cliente) do
    IO.puts "CPF: #{cliente.cpf}"
    IO.puts "Nome: #{cliente.nome}"
    IO.puts "Email: #{cliente.email}"
    IO.puts "Telefone: #{cliente.telefone}"
    IO.puts "------------------------"
  end
end

defmodule Main do
  def start() do
    clientes = []
    loop(clientes)
  end

  def loop(clientes) do
    IO.puts "1 - Cadastrar cliente"
    IO.puts "2 - Listar clientes"
    IO.puts "3 - Remover cliente"
    IO.puts "4 - Sair"
    IO.puts "Escolha uma opção: "

    case IO.gets("") |> String.trim() do
      "1" -> cadastrar_cliente(clientes)
      "2" -> listar_clientes(clientes)
      "3" -> remover_cliente(clientes)
      "4" -> IO.puts "Encerrando o programa."
      _ -> IO.puts "Opção inválida. Tente novamente."
    end
  end

  def cadastrar_cliente(clientes) do
    IO.puts "Digite o nome do cliente: "
    nome = IO.gets("") |> String.trim()

    IO.puts "Digite o email do cliente: "
    email = IO.gets("") |> String.trim()

    IO.puts "Digite o telefone do cliente: "
    telefone = IO.gets("") |> String.trim()

    IO.puts "Digite o CPF do cliente: "
    cpf = IO.gets("") |> String.trim()

    cliente = CadastroClientes.criar_cliente(cpf, nome, email, telefone)
    clientes = [cliente | clientes]

    IO.puts "Cliente cadastrado com sucesso."
    loop(clientes)
  end

  def listar_clientes(clientes) do
    IO.puts "------------------------"
    Enum.each(clientes, &CadastroClientes.imprimir_cliente/1)
    loop(clientes)
  end

  def obter_cliente_por_cpf(cpf, clientes) do
    Enum.find(clientes, fn cliente -> cliente.cpf == cpf end)
    loop(clientes)
  end

  def remover_cliente(clientes) do
    IO.puts "Digite o CPF que seja excluir: "
    cpf = IO.gets("") |> String.trim()    
    Enum.filter(clientes, fn cliente -> cliente.cpf != cpf end)
    IO.puts "Cliente removido"
    loop(clientes)
  end
end

Main.start()
