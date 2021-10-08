


let endereco:any;
const cep = <HTMLElement>document.getElementById('cep');
async function pesquisaCep() {
    const url = `http://viacep.com.br/ws/${cep}/json`;
    const dados = await fetch(url);
    /* endereço recebe o json retornado */
    endereco = await dados.json();
    console.log(endereco)

}
let logradouro = (<HTMLElement>document.getElementById('rua'));
let bairro = (<HTMLElement>document.getElementById('bairro'));
let localidade = (<HTMLElement>document.getElementById('cidade'));
let uf = (<HTMLElement>document.getElementById('estado'));

const preencheForm = (endereco:any) => {

    logradouro = endereco.logradouro
    bairro = endereco.bairro;
    localidade = endereco.localidade = 
    uf = endereco.uf 
}

cep.addEventListener('focusout', event => {
    pesquisaCep();
    setTimeout(function () {
        preencheForm(endereco);
    }, 50)
});


