// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.12;

contract Census{
    //admin can remove citizens
    //check number of children, adults, males, females

    address admin;

    constructor(){
        admin = msg.sender;
    }

    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }

    // mapping(address => bool) proofOfLife;
    // mapping(uint => children[]) c;
    mapping(address => setIdentity) checkDetails;
    enum Gender{
            male,
            female
        }

    struct setIdentity{
        bool alive;
        uint age;
        Gender gender;
        address id;
    }

    setIdentity[] citizensArr;
    
    setIdentity[] children;
    setIdentity[] adults;
    setIdentity[] dead;
    setIdentity[] females;
    setIdentity[] males;


    function checkAlive(address _isAlive) public view returns(bool){
        return checkDetails[_isAlive].alive;
    }

    function addCitizen(bool _alive, uint _age, Gender _gender, address _id) public{
        setIdentity memory setidentity = setIdentity(_alive,_age, _gender, _id);
        if(_alive == false){
            dead.push(setidentity);
            checkDetails[_id]= setidentity;
        }
        if(_age < 18 && _gender == Gender.male){
            children.push(setidentity);
            males.push(setidentity);
            citizensArr.push(setidentity);
            checkDetails[_id]= setidentity;
        }
        if(_age < 18 && _gender == Gender.female){
            children.push(setidentity);
            females.push(setidentity);
            citizensArr.push(setidentity);
            checkDetails[_id]= setidentity;
        }
        if(_age > 18 && _gender == Gender.male){
            adults.push(setidentity);
            males.push(setidentity);
            citizensArr.push(setidentity);
            checkDetails[_id]= setidentity;
        }
        if(_age > 18 && _gender == Gender.female){
            adults.push(setidentity);
            females.push(setidentity);
            citizensArr.push(setidentity);
            checkDetails[_id]= setidentity;
        }
        // citizensArr.push(setidentity);
        checkDetails[_id]= setidentity;
    }

    function viewDetails() view public returns(setIdentity[] memory){
        return citizensArr; 
    }
    
    function population() view public returns(uint){
        return citizensArr.length;
    }

    function viewChildren() public view returns(setIdentity[] memory){
        return children;
    }

    function checkDetail(address _address) public view returns(setIdentity memory) {
        require(_address != address(0),"Input registered address");
        require(_address == checkDetails[_address].id,"Input registered address");
        return checkDetails[_address];
    }

    function deleteArr(uint _index) public onlyAdmin{
  
        //  for(uint i=0; i < citizensArr.length; i++){
        //      if(citizensArr[i] == citizensArr.id){
                 
        //      }
        //  }
        citizensArr[_index] = citizensArr[citizensArr.length - 1];
        citizensArr.pop();
    }
}