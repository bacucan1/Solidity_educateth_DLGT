// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract tc_arb{
    address payable public owner;
    struct Data{
        string date;                // Fecha de envio
        string delivery_sate;       // Fecha estimada de llegada
        string product;             // Nombre producto
        string price;               // Precio del producto
        string code;                // Identificador del proveedor
        string cel_number;          // Contacto del comprador
        int8 status;                // 1. En camino, 2. Llego al pais, 3. esta en la aduana y 4. entregado
        address wallet;             // Persona que ejecuto el contrato
    }
    Data public data;
    event newData(
        string date,                // Fecha de envio
        string delivery_sate,       // Fecha estimada de llegada
        string product,             // Nombre producto
        string price,               // Precio del producto
        string code,                // Identificador del proveedor
        string cel_number,          // Contacto del comprador
        int8 status,                // 1. En camino, 2. Llego al pais, 3. esta en la aduana y 4. entregado
        address wallet             // Persona que ejecuto el contrato
    );
    
    modifier onlyOwner(){
        require(msg.sender==owner, "Solo el propietario puede retirar fondos");
        _;
    }

    modifier cost(uint amount){
        require(msg.value>=amount, "No tiene saldo en arb para ejecutar");
        _;
    }
    constructor(){
        owner=payable(msg.sender);
    }
    function pushData(string memory _date,
        string memory _delivery_date,
        string memory _product,
        string memory _price,
        string memory _code,
        string memory _cel_number,
        int8 _status)
        public payable cost(1000000000000000){
            data = Data(_date,
            _delivery_date,
            _product,
            _price,
            _code,
            _cel_number,
            _status,
            msg.sender);

            emit newData(_date,
            _delivery_date,
            _product,
            _price,
            _code,
            _cel_number,
            _status,
            msg.sender);
        }
        function withdraw() public onlyOwner{
            uint balance = address(this).balance;
            require(balance>0, "No se tienen fondos en el contrato todavia");
            owner.transfer(balance);
        }
        function getBalance() public view returns (uint256){
            return address(this).balance;
        }
}