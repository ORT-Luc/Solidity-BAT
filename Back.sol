pragma solidity >=0.4.16 <0.9.0;
import "Route.sol";

contract Back 
{
    address public deployer;
    address[] public companies;
    address[] public routes;

    constructor(address _deployer)
    {
        deployer = _deployer;
    }

    function initializeRoute(address _company, int32 _time) public
    {
       
    }

    function updateRoute(address _company) public
    {

    }
    
    function endRoute(address _company) public
    {

    }
    
}