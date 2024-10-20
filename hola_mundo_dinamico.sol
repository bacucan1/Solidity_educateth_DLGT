// SPDX-License-Identifier: MIT

pragma solidity 0.8.26; //Version del compilador

//Comienzo del contrato
contract hola_mundo_dinamico{
    string saludo_dinamico = "Hola mundo dinamico"; 
    string public saludo_estatico = "Hola este es un saludo estatico"; 
    function leer_saludo() public view returns (string memory){
        return saludo_dinamico;
    }
        function guardarSaludo(string memory _nuevoSaludo) public {
        saludo_dinamico = _nuevoSaludo;
    }

}