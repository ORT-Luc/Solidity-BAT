pragma solidity >=0.4.16 <0.9.0;
import "Company.sol";


contract Route
{
    struct SensorsData
    {
        int16 temperature;
        uint8 humidity;
        uint16 weight;
        int32 timestamp;
    }

    address private routeAddress;
    address private company;
    int32 private startTime;
    int32 private endTime;
    bool private finished;
    SensorsData[] private sensorsData;

    // Updater
    constructor(address _company, int32 _time)
    {
        routeAddress = address(this);
        company = _company;
        Company(_company).addRoute(routeAddress);
        finished = false;
        startTime = _time;
    }

    function update(int16 _temperature, uint8 _humidity, uint16 _weight, int32  _date) public
    {
        require(!finished, "The route has ended");
        if(!finished)
        {  
            sensorsData.push(SensorsData(_temperature, _humidity, _weight, _date));
        }
    }

    function end(int32 _time) public
    {
        finished = true;
        endTime = _time;
    }

    // Getters 
    function getResume() public view returns(string memory, bool, int32, int32)
    {
        return (Company(company).getName(), finished, startTime, endTime);
    }

    function getAddress() public view returns(address)
    {
        return routeAddress;
    }

    function getRawData() public view returns(SensorsData[] memory)
    {
        return sensorsData;
    }

    function getIndexData(uint32 index) public view returns(SensorsData memory)
    {
        require(index > sensorsData.length, "Index out of range");
        return  sensorsData[index];
    }     
}