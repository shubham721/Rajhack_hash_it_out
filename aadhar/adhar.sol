pragma solidity ^0.4.18;

contract Adhar {
struct aadhar{
   string adharId;
   string name;
   string dob;
   string perAddress;
   string mobile;
  
}
address private adharAdress;
mapping (address => aadhar) adharMap;

modifier ownerFunc{
    require(adharAdress==msg.sender);
    _;
}

   
   function enrollData(string _adharId, string _name,string _dob,string _perAddress,string _mobile) ownerFunc public {
      var adharblock=adharMap[adharAdress];
      adharblock.adharId=_adharId;
      adharblock.name =_name;
      adharblock.dob=_dob;
      adharblock.perAddress=_perAddress;
      adharblock.mobile=_mobile;
   }
   
 function getData() ownerFunc public constant returns (string, string) {
        var adharblock=adharMap[adharAdress];
       return (adharblock.adharId, adharblock.name);
   }

    
}