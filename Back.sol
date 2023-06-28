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

    function createCompany(string memory name) public 
    {
        Company company = new Company(name);
        companies.push(company.getAddress());
    }

    function initializeRoute(address _company, int32 _time) public
    {
       for(uint i = 0; i < companies.length;i++)
       {
           Company com = Company(companies[i]);
           if(com.getAddress() == _company)
           {
               Route route = new Route(_company, _time);
               routes.push(route.getAddress());
               companies.push(route.getAddress());
               break;
           }
       }
    }

    function updateRoute(address _route, int16 _temperature, uint8 _humidity, uint16 _weight, int32  _date) public
    {
        Route route = Route(_route);
        route.update(_temperature, _humidity, _weight, _date);
    }
    
    function endRoute(address _route, int32 _time) public
    {
        Route route = Route(_route);
        route.end(_time);
    }
    
}