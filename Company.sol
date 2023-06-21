pragma solidity >=0.4.16 <0.9.0;

contract Company
{
    string private name;
    address private companyAddress;
    address[] private routes;


    constructor(string memory _name)
    {
        name = _name;
        companyAddress = address(this);
    }

    function addRoute(address route) public 
    {
        routes.push(route);           
    }

    function getRoute(uint32 index) public view returns (address)
    {
        return routes[index];
    }

    function getRoutes() public view returns (address[] memory)
    {
        return routes;
    }

    function getAddress() public view returns(address)
    {
        return companyAddress;
    }
    
    function getName() public view returns (string memory)
    {
        return name;
    }

}