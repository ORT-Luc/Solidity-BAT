pragma solidity >=0.4.16 <0.9.0;

contract BAT
{
    struct SensorsData
    {
        uint64 temperature;
        uint64 humidity;
        uint64 weight;
        uint256 date;
    }
    
    mapping(uint256 => SensorsData[]) private route;
    mapping(string => uint256[]) private company;

    function initializeRoute(string memory _company, uint256 _id) public
    {
        company[_company].push(_id);
    }

    function updateRoute(uint256 _id, uint64 _temperature, uint64 _humidity, uint64 _weight, uint _date) public
    {
        route[_id].push(SensorsData(_temperature, _humidity, _weight, _date));
    }

    function finishRoute(uint256 _id) public
    {
           
    }

    function getRouteById(uint256 _id) public view returns(SensorsData[] memory, uint256)
    {
        return (route[_id],route[_id].length);
    }

    function getCompanyRoutes(string memory _company) public view returns(uint256[] memory)
    {
        return (company[_company]);
    }
/*
    function emitData(uint64 _temperature, uint64 _humidity, uint64 _weight) public 
    {
        data[0].push(SensorsData(_temperature, _humidity, _weight));
    }
*/
}