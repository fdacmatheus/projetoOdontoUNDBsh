
var endereco;
async function pesquisarCep() {
    const cep = document.getElementById('cep').value;
    const url = `http://viacep.com.br/ws/${cep}/json`;

    const dados = await fetch(url);
    /* endereço recebe o json retornado */
    endereco = await dados.json();
    console.log(endereco)

}
const preencherForm = (endereco) => {
    document.getElementById('rua').value = endereco.logradouro;
    document.getElementById('bairro').value = endereco.bairro;
    document.getElementById('cidade').value = endereco.localidade;
    document.getElementById('estado').value = endereco.uf;

}

document.getElementById('cep').addEventListener('focusout', event => {
    pesquisarCep();
    setTimeout(function () {
        preencherForm(endereco);
    }, 50)
});


